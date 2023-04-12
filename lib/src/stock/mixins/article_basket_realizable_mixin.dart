import 'package:models_weebi/closings.dart' show ClosingStockShop;
import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/weebi_models.dart';
import 'package:mixins_weebi/src/stock/abstracts/article_stock_abstract.dart';

mixin ArticleBasketRealizableNow on ArticleStockStatelessAbstract {
  // computes the number of articles basket available
  // => required quantites per each lot in basket
  // a lot is a reference to an ArticleWeebi with a minimum qt needed to complete a basket
  // for example my vegetable basket includes x3 carots and x2 tomatoes
  // so if I have 9 carots left I can only make x3 baskets
  int basketsRealizableNow(Iterable<BasketWrapper> thoseGoddamWrappers) {
    final wrapRealizableBasketsTo = <int>[];
    for (final w in thoseGoddamWrappers) {
      final thatWrapRealizableBasket =
          (w.stockRemaining / w.minimumUnitPerBasket)
              .floor(); // round to lowest int
      wrapRealizableBasketsTo.add(thatWrapRealizableBasket);
    }
    wrapRealizableBasketsTo.sort();
    return wrapRealizableBasketsTo.first;
  }

  Iterable<BasketWrapper> articleBasketWrapThem(
    Iterable<ClosingStockShop> cStockShops,
    Iterable<TicketWeebi> tickets,
    Iterable<LineOfArticles> lines,
    DateTime start, // useless
    DateTime end,
  ) {
    if (article is ArticleBasket) {
      final articlesAndMinimQt =
          lines.articleBasketWrapThemExt(article as ArticleBasket, start, end);
      // find the level of article stock remaining
      // divide it by the minimum qt in basket
      final articlesAndRemainingStock = <BasketWrapper>[];
      for (final wrapper in articlesAndMinimQt) {
        final stockRemaining = articleStockRemaining(
            cStockShops, tickets, start, end,
            wrappedArticle: wrapper.article);
        final articleAndRemainingStock =
            wrapper.copyWith(stockRemaining: stockRemaining);
        articlesAndRemainingStock.add(articleAndRemainingStock);
      }
      return articlesAndRemainingStock;
    } else {
      throw 'not articleBasket';
    }
  }

  @override // wrappedArticle != ArticleBasket !!
  double articleStockRemaining(Iterable<ClosingStockShop> cStockShops,
      Iterable<TicketWeebi> tickets, DateTime start, DateTime end,
      {Article wrappedArticle}) {
    return _articleClosingFinalQt(cStockShops, wrappedArticle, end: end) +
        _articleTkQtIn(wrappedArticle, tickets, start, end) -
        _articleTkQtOut(wrappedArticle, tickets, start, end);
  }

  double _articleClosingFinalQt(
    Iterable<ClosingStockShop> cStockShops,
    Article wrappedArticle, {
    DateTime end,
  }) {
    return cStockShops.stockShopArticleFinalQuantityAbsoluteForWeebi(
        wrappedArticle,
        end: end ?? DateTime.now());
  }

  double _articleTkQtIn(
    Article wrappedArticle,
    Iterable<TicketWeebi> tickets,
    DateTime start,
    DateTime end,
  ) {
    final articleQuantityIn =
        tickets.stockArticleInput(wrappedArticle, range: DateRange(start, end));
    return articleQuantityIn;
  }

  double _articleTkQtOut(
    Article wrappedArticle,
    Iterable<TicketWeebi> tickets,
    DateTime start,
    DateTime end,
  ) {
    final articleQuantityOut = tickets.stockArticleOutput(wrappedArticle,
        range: DateRange(start, end));
    return articleQuantityOut;
  }
}
