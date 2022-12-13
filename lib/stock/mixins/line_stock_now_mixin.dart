import 'package:closing/closing.dart';
import 'package:models_base/utils.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:views_weebi/stock.dart';

import 'package:models_weebi/abstractions.dart';
import 'package:closing/closing_abstraction.dart';
import 'package:mixins_weebi/mixins_weebi.dart';

mixin LineArticleStockNowMixin<T extends AbstractStore,
    C extends AbstractClosingsStore> on LineArticleStockAbstract {
  // like productStockRange, but no need to declare fake start/end Dates
  // also better to distinguish analytics from operations

  late MobxTicketsStoreCreator<T> ticketsStoreCreator;
  late MobxClosingStoreCreator<C> closingsStoreCreator;
  
  
   ticketsStoreCreatorInit(BuildContext context) => () => context.ticketsStore;
        closingsStoreCreator: () => context.closingsStore,

  double lineStockNow(
    Iterable<ClosingStockShop> closingStockShops,
    Iterable<TicketWeebi> tickets,
  ) {
    // this is stock now, not on the time range selected in dashboard
    // including the selected shop in the view OR all shops
    // but no dashboard
    final start = WeebiDates.defaultFirstDate;
    final end = DateTime.now();
    return lineClosingFinalQt(closingStockShops, end: end) +
        lineTkQtIn(tickets, start, end) -
        lineTkQtOut(tickets, start, end);
  }
}
