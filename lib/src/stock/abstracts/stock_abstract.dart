import 'package:mixins_weebi/src/invokers.dart';

abstract class StockAbstract {
  final TicketsInvoker ticketsInvoker;
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  const StockAbstract(this.ticketsInvoker, this.closingStockShopsInvoker);
}
