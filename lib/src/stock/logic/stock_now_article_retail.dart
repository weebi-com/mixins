import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_article_abstract.dart';
import 'package:models_weebi/utils.dart' show DateRange, WeebiDates;
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

class StockNowArticleRetail
    implements StockNowArticleRetailAbstract<ArticleRetail> {
  final List<ArticleLine> linesNoQuickspend; // used to identify articles in the

  @override
  final ArticleRetail article;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  final DateTime start;
  final DateTime end;
  StockNowArticleRetail(
    this.article,
    this.ticketsInvoker,
    this.closingStockShopsInvoker,
    this.linesNoQuickspend,
  )   : start = WeebiDates.defaultFirstDate,
        end = DateTime.now();

  @override
  double get stockNow =>
      closingStockShopsInvoker()
          .stockShopArticleFinalQuantityAbsoluteForWeebi(article, end: end) +
      (ticketsInvoker()
              .stockArticleInput(article, range: DateRange(start, end)) -
          ticketsInvoker()
              .stockArticleOutput(article, range: DateRange(start, end)));
}
