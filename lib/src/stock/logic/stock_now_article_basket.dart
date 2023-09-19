import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_article_abstract.dart';
import 'package:models_weebi/base.dart';

import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange, WeebiDates;
import 'package:models_weebi/weebi_models.dart';

class ArticleBasketRealizablekNow<A extends ArticleAbstract>
    implements StockNowArticleBasketAbstract {
  final List<ArticleCalibre<A>>
      calibresNoQuickspend; // used to identify articles in the basket
  @override
  final ArticleBasket article;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  final DateTime start;
  final DateTime end;
  ArticleBasketRealizablekNow({
    required this.article,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
    required this.calibresNoQuickspend,
  } // ? TODO make this invoker
      )  : start = WeebiDates.defaultFirstDate,
        end = DateTime.now();

  @override
  int get stockRealizablesBasketsNow {
    final wrapRealizableBasketsTo = <int>[];
    // for each articles in the basket
    // find the stocklevel divided by the minimum qt in basket
    // => max numbers of baskets that can be made
    for (final basketWrap in articleBasketWrapped) {
      final maxNumbersOfBasketsRealizable =
          (basketWrap.stockRemaining / basketWrap.minimumUnitPerBasket)
              .floor(); // round to lowest int
      wrapRealizableBasketsTo.add(maxNumbersOfBasketsRealizable);
    }
    if (wrapRealizableBasketsTo.isEmpty) {
      return 0; // strange but prevent possible error
    }
    wrapRealizableBasketsTo.sort();
    // the article with the least stock limits the numbers of possible baskets
    return wrapRealizableBasketsTo.first;
  }

  Iterable<BasketWrapper> get articleBasketWrapped {
    final articlesAndMinimQt =
        calibresNoQuickspend.articleBasketWrapThemExt(article, start, end);
    final articlesAndRemainingStock = <BasketWrapper>[];
    for (final wrapper in articlesAndMinimQt) {
      final stockRemaining =
          _articleStockRemaining(wrappedArticle: wrapper.article);
      final articleAndRemainingStock =
          wrapper.copyWith(stockRemaining: stockRemaining);
      articlesAndRemainingStock.add(articleAndRemainingStock);
    }
    return articlesAndRemainingStock;
  }

  double _articleStockRemaining({required ArticleRetail wrappedArticle}) =>
      (ticketsInvoker().stockArticleInput(
            wrappedArticle,
            range: DateRange(start, end),
          ) -
          ticketsInvoker().stockArticleOutput(
            wrappedArticle,
            range: DateRange(start, end),
          )) +
      closingStockShopsInvoker().stockShopArticleFinalQuantityAbsoluteForWeebi(
        wrappedArticle,
        end: end,
      );
}
