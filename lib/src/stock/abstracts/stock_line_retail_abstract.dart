import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_abstract.dart';
// import 'package:models_weebi/base.dart';
import 'package:models_weebi/weebi_models.dart';

abstract class StockLineRetailArticleAbstract<AR extends ArticleRetail>
    extends StockAbstract {
  final ArticleCalibre<AR> calibreRetail;
  StockLineRetailArticleAbstract(
      this.calibreRetail,
      TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker)
      : super(ticketsInvoker, closingStockShopsInvoker);
}

abstract class StockNowLineRetailAbstract<AR extends ArticleRetail>
    extends StockLineRetailArticleAbstract<AR> {
  StockNowLineRetailAbstract(
    ArticleCalibre<AR> articleCalibreRetail,
    TicketsInvoker ticketsInvoker,
    ClosingStockShopsInvoker closingStockShopsInvoker,
  ) : super(articleCalibreRetail, ticketsInvoker, closingStockShopsInvoker);

  double get stockNow;
}

abstract class StockDiffLineRetailAbstract
    extends StockLineRetailArticleAbstract {
  final DateTime start;
  final DateTime end;
  StockDiffLineRetailAbstract(
    ArticleCalibre<ArticleRetail> line,
    this.start,
    this.end,
    TicketsInvoker ticketsInvoker,
    ClosingStockShopsInvoker closingStockShopsInvoker,
  ) : super(line, ticketsInvoker, closingStockShopsInvoker);

  double get stockDiffOverTimeRange;
}
