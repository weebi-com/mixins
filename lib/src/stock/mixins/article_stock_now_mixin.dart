import 'package:models_weebi/closings.dart' show ClosingStockShop;

import 'package:models_weebi/base.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:mixins_weebi/src/stock/abstracts/article_stock_abstract.dart';

mixin ArticleStockNowMixin<A extends ArticleAbstract>
    on ArticleStockStatelessAbstract<A> {
  //like articleStockRange, but not need to declare fake start/end Dates
  // + better distinguish analytics from operations
  double articleStockNow(
      Iterable<ClosingStockShop> cStockShops, Iterable<TicketWeebi> tickets) {
    // this is stock now, not on the time range selected in dashboard
    // including the selected shop in the view OR all shops
    // but no dashboard
    final start = WeebiDates.defaultFirstDate;
    final end = DateTime.now();
    return articleClosingFinalQt(cStockShops, end: end) +
        articleTkQtIn(tickets, start, end) -
        articleTkQtOut(tickets, start, end);
  }
}