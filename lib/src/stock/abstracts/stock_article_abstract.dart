import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_abstract.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/weebi_models.dart';

abstract class StockArticleAbstract<A extends ArticleAbstract>
    extends StockAbstract {
  final A article;
  StockArticleAbstract(this.article, TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker)
      : super(ticketsInvoker, closingStockShopsInvoker);
}

abstract class StockNowArticleBasketAbstract
    extends StockArticleAbstract<ArticleBasket> {
  StockNowArticleBasketAbstract(
      ArticleBasket article,
      TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker)
      : super(article, ticketsInvoker, closingStockShopsInvoker);

  int get stockRealizablesBasketsNow;
}

abstract class StockNowArticleRetailAbstract<A extends ArticleRetail>
    extends StockArticleAbstract<A> {
  StockNowArticleRetailAbstract(A article, TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker)
      : super(article, ticketsInvoker, closingStockShopsInvoker);

  double get stockNow;
}

abstract class StocDiffArticleRetailAbstract<A extends ArticleRetail>
    extends StockArticleAbstract<A> {
  final DateTime start;
  final DateTime end;
  StocDiffArticleRetailAbstract(A article, TicketsInvoker ticketsInvoker,
      ClosingStockShopsInvoker closingStockShopsInvoker, this.start, this.end)
      : super(article, ticketsInvoker, closingStockShopsInvoker);
  double get stockDiffOverTimeRange;
}
