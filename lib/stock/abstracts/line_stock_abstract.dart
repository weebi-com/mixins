import 'package:closing/closing.dart'
    show ClosingStockShop, ClosingStockShopProduct;
import 'package:closing/closing_extensions.dart' show StockItUpTillYaGetEnough;
import 'package:flutter/material.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/weebi_models.dart';
import 'package:models_weebi/extensions.dart';

typedef TicketsInvoker = Iterable<TicketWeebi> Function();
typedef ClosingStockShopsInvoker
    = Iterable<ClosingStockShop<ClosingStockShopProduct>> Function();

abstract class LineArticleStockAbstract<ClosingsStore, TicketsStore>
    extends StatelessWidget {
  final LineOfArticles line;

  final TicketsInvoker ticketsInvoker;
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  // * this is not needed keeping it here as a reminder for future inspiration where stores need to be passed
  // final MobxTicketsStoreCreator mobxTicketsStoreCreator;
  // final MobxClosingStoreCreator mobxClosingStoreCreator;
  const LineArticleStockAbstract(
      this.line, this.ticketsInvoker, this.closingStockShopsInvoker,
      {super.key});

  bool get isSingleArticle => line.articles.length <= 1;

  double lineStockRemaining(Iterable<TicketWeebi> tickets, DateTime start,
          DateTime end, Iterable<ClosingStockShop> closingsStockShops) =>
      lineClosingFinalQt(closingsStockShops, end: end) +
      lineTkQtIn(tickets, start, end) -
      lineTkQtOut(tickets, start, end);

  double lineStockDiffOverTimeRange(
    Iterable<ClosingStockShop> closingStockShops,
    Iterable<TicketWeebi> tickets,
    DateTime start,
    DateTime end,
  ) {
    return lineClosingDiffOverTimeRange(closingStockShops, start, end) +
        lineTkQtIn(tickets, start, end) -
        lineTkQtOut(tickets, start, end);
  }

  double lineClosingFinalQt(Iterable<ClosingStockShop> closingStockShops,
      {DateTime? end}) {
    return closingStockShops.stockShopLineFinalQuantityAbsoluteForWeebi(line,
        end: end ?? DateTime.now());
  }

  double lineClosingDiffOverTimeRange(
      Iterable<ClosingStockShop> closingsStockShops,
      DateTime start,
      DateTime end) {
    return closingsStockShops.stockShopProductDiffTimeRangeForWeebi(
        line, start, end);
  }

  double lineTkQtIn(
      Iterable<TicketWeebi> tickets, DateTime start, DateTime end) {
    final quantityIn =
        tickets.stockLineInput(line, range: DateRange(start, end));
    return quantityIn;
  }

  double lineTkQtOut(
      Iterable<TicketWeebi> tickets, DateTime start, DateTime end) {
    //print('in lineTkQtOut');
    final quantityOut =
        tickets.stockLineOutput(line, range: DateRange(start, end));
    return quantityOut;
  }
}
