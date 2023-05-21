import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_abstract.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/weebi_models.dart';

abstract class StockLineRetailArticleAbstract<A extends ArticleAbstract>
    extends StockAbstract {
  final ArticleCalibre<ArticleRetail> articleCalibreRetail;
  StockLineRetailArticleAbstract(
      this.articleCalibreRetail,
      TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker)
      : super(ticketsInvoker, closingStockShopsInvoker);
}

abstract class StockNowLineRetailAbstract
    extends StockLineRetailArticleAbstract {
  StockNowLineRetailAbstract(
    ArticleCalibre<ArticleRetail> articleCalibreRetail,
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
