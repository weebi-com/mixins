// import 'package:closing/extensions/filter_by_range.dart';
// import 'package:closing/src/models/closing_ledger_shop.dart';
// import 'package:models_weebi/common.dart';

// * NOT USED AT THE MOMENT
// * logic is splitted in store
// extension ClosingSumLedgerShopsTicketTypeEndDate
//     on Iterable<ClosingLedgerShop> {
//   int sumLedgerShopsTicketTypeEndDate(List<String> shopUuids, String ticketType,
//       {DateTime end}) {
//     var tt = 0;
//     if (shopUuids.isNotEmpty && isNotEmpty) {
//       final filterByDate =
//           (end != null) ? filterByEndDate(end).toList() : toList();
//       filterByDate.toList().sort((a, b) =>
//           a.closingRange.startDate.compareTo(b.closingRange.startDate));
//       for (final uuid in shopUuids) {
//         final filterByShop =
//             filterByDate.where((cL) => cL.shopUuid == uuid).last;
//         {
//           switch (TicketType.tryParse(ticketType)) {
//             case TicketType.sell:
//               tt += filterByShop.sell;
//               break;
//             case TicketType.sellDeferred:
//               tt += filterByShop.sellDeferred;
//               break;
//             case TicketType.sellCovered:
//               tt += filterByShop.sellCovered;
//               break;
//             case TicketType.spend:
//               tt += filterByShop.spend;
//               break;
//             case TicketType.spendDeferred:
//               tt += filterByShop.spendDeferred;
//               break;
//             case TicketType.spendCovered:
//               tt += filterByShop.spendCovered;
//               break;
//             case TicketType.wage:
//               tt += filterByShop.wage;
//               break;
//             case TicketType.unknown:
//               print('TicketType.unknown in sumLedgerShopsTicketTypeRange');
//               break;
//             default:
//               print('TicketType is null sumLedgerShopsTicketTypeRange kai kai');
//               return null;
//           }
//         }
//       }
//     }
//     return tt;
//   }
// }
