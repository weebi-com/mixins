import 'package:mixins_weebi/src/instantiate_stores/tickets.dart';

import 'package:models_weebi/common.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:test/test.dart';

Future main() async {
  final testTicketsStore = TicketsStoreInstantiater.noPersistence;
  final now = DateTime.now();
  // ignore: missing_required_param
  final ticket = TicketWeebi(
      id: 1,
      shopId: 'entrepot',
      items: [ItemCartWeebi(() => ArticleRetail.dummy, 0)],
      taxe: TaxWeebi.noTax,
      promo: 0.0,
      comment: 'no comment',
      received: 0,
      date: WeebiDates.febStart,
      paiementType: PaiementType.cash,
      ticketType: TicketType.sell,
      contactId: 0,
      status: true,
      statusUpdateDate: now,
      creationDate: now,
      oid: "",
      discountAmount: 0);
  final ticket2 = TicketWeebi(
      id: 1,
      oid: '1',
      shopId: 'entrepot',
      items: [],
      taxe: TaxWeebi.noTax,
      promo: 0.0,
      comment: 'no comment',
      received: 0,
      date: WeebiDates.febStart,
      paiementType: PaiementType.cash,
      ticketType: TicketType.sell,
      contactId: 0,
      status: true,
      statusUpdateDate: now,
      creationDate: now,
      discountAmount: 0);

  group('test tickets disable  store', () {
    test('create_ticket', () async {
      //final createdTicket =
      await testTicketsStore.addTicket(ticket);
      await testTicketsStore.addTicket(ticket2);
      expect(testTicketsStore.tickets.length, 2);
    });
    test('disable_ticket', () async {
      final updatedTicket = await testTicketsStore.disableTicket(ticket2);
      print('${updatedTicket.toJson()}');
      expect(updatedTicket.status, false);
      expect(testTicketsStore.tickets.length, 2);
    });
    test('restore_ticket', () async {
      final updatedTicket = await testTicketsStore.restoreTicket(ticket);
      expect(testTicketsStore.tickets.length, 2);
      expect(updatedTicket.status, true);
    });
  });
}
