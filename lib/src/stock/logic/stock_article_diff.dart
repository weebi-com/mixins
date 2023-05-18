import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_article_abstract.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

class ArticleStockDiff<A extends ArticleRetail>
    implements StocDiffArticleRetailAbstract<A> {
  @override
  final A article;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  @override
  final DateTime start;
  @override
  final DateTime end;
  ArticleStockDiff(this.article, this.ticketsInvoker,
      this.closingStockShopsInvoker, this.start, this.end);

  @override
  double get stockDiffOverTimeRange =>
      closingStockShopsInvoker().stockShopArticleQtInTimeRangeForWeebi(
          article, DateRange(start, end)) -
      closingStockShopsInvoker().stockShopArticleQtOutTimeRangeForWeebi(
          article, DateRange(start, end)) +
      ticketsInvoker()
          .stockArticleInput(article, range: DateRange(start, end)) -
      ticketsInvoker()
          .stockArticleOutput(article, range: DateRange(start, end));
}
