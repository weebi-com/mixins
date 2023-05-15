import 'package:models_weebi/closings.dart'
    show ClosingStockShop, ClosingStockShopProduct;
import 'package:models_weebi/weebi_models.dart';

// * this makes an easy future evolution easier
// if need to use another type of ticket, only change it here
// no need to use generics all over the place

typedef TicketsInvoker = Iterable<TicketWeebi> Function();
typedef ClosingStockShopsInvoker
    = Iterable<ClosingStockShop<ClosingStockShopProduct>> Function();
