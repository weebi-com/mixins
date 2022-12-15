import 'package:closing/closing.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:models_base/utils.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:mixins_weebi/stock/abstracts/line_stock_abstract.dart';

import 'package:models_weebi/abstractions.dart';
import 'package:closing/closing_abstraction.dart';
import 'package:closing/closing_store.dart';

import 'package:mixins_weebi/mixins_weebi.dart';

// Faking it
// TODO impemet ticketstore here
class TicketsStore = TicketsStoreBase with _$TicketsStore;

abstract class TicketsStoreBase extends AbstractStore with Store {}

mixin LineArticleStockNowMixin on LineArticleStockAbstract {
  // like productStockRange, but no need to declare fake start/end Dates
  // also better to distinguish analytics from operations

  initIt() {}
  late MobxTicketsStoreCreator ticketsStoreCreator;
  late MobxClosingStoreCreator closingsStoreCreator;

  double get lineStockNow {
    // this is stock now, not on the time range selected in dashboard
    // including the selected shop in the view OR all shops
    // but no dashboard
    final ticketsStore = ticketsStoreCreator() as TicketsStore;
    final closingsStore = closingsStoreCreator() as ClosingsStore;
    final tickets =
        <TicketWeebi>[]; // !! consider using Set instead of Iterable ??

    final closingStockShops = closingsStore
        .closingStockShops; // difficult to filter : closingStockShop.first.products.first.id;
    final start = WeebiDates.defaultFirstDate;
    final end = DateTime.now();
    return lineClosingFinalQt(closingStockShops, end: end) +
        lineTkQtIn(tickets, start, end) -
        lineTkQtOut(tickets, start, end);
  }
}
