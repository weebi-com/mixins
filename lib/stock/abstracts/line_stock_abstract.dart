import 'package:closing/closing.dart' show ClosingStockShop;
import 'package:closing/closing_abstraction.dart';
import 'package:closing/closing_extensions.dart' show StockItUpTillYaGetEnough;
import 'package:flutter/material.dart';
import 'package:models_weebi/abstractions.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/weebi_models.dart';
import 'package:models_weebi/extensions.dart';

abstract class LineArticleStockAbstract<ClosingsStore, TicketsStore>
    extends StatelessWidget {
  final LineOfArticles line;
  // store is used on purpose here, I do not want / know yet how to trim it to iterable
  final MobxTicketsStoreCreator mobxTicketsStoreCreator;
  final MobxClosingStoreCreator mobxClosingStoreCreator;
  const LineArticleStockAbstract(
      this.line, this.mobxTicketsStoreCreator, this.mobxClosingStoreCreator,
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
        end: end);
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
