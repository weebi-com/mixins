import 'package:mixins_weebi/src/instantiate_stores/tickets.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:test/test.dart';

Future main() async {
  final testTicketsStore = TicketsStoreInstantiater.noPersistence;
  final now = DateTime.now();
  // ignore: missing_required_param
  final ticket = TicketWeebi(
    id: 1,
    shopId: 'entrepot',
    items: [],
    taxe: TaxWeebi.noTax,
    promo: 0.0,
    comment: 'no comment',
    received: 0,
    date: WeebiDates.febStart,
    paiementType: PaiementType.cash,
    ticketType: TicketType.sell,
    contactInfo: '0',
    status: true,
    statusUpdateDate: now,
    creationDate: now,
    oid: '',
    discountAmount: 0,
  );
  // ignore: missing_required_param
  final ticket2 = TicketWeebi(
    comment: '',
    oid: '',
    taxe: TaxWeebi.noTax,
    id: 2,
    shopId: 'shopId',
    creationDate: now.add(Duration(seconds: 4)),
    paiementType: PaiementType.cash,
    ticketType: TicketType.sell,
    contactInfo: '0',
    promo: 0.0,
    received: 0,
    items: [ItemCartWeebi(() => ArticleRetail.dummy, 0)],
    status: true,
    date: now.add(Duration(hours: 1)),
    statusUpdateDate: now.add(Duration(hours: 1)),
  );

  group('test tickets store', () {
    test('create ticket & disable & restore  ', () async {
      //final createdTicket =
      final t = await testTicketsStore.addTicket(ticket);
      final t2 = await testTicketsStore.addTicket(ticket2);
      expect(t, ticket);
      expect(t2, ticket2);
      expect(testTicketsStore.tickets.length, 2);
      final disabledTicket = await testTicketsStore.disableTicket(ticket);
      expect(testTicketsStore.tickets.length, 2);
      expect(disabledTicket.status, false);
      final restoredTicket = await testTicketsStore.restoreTicket(ticket);
      expect(testTicketsStore.tickets.length, 2);
      expect(restoredTicket.status, true);
    });

    test('delete_all', () async {
      await testTicketsStore.deleteAllTickets();
      expect(testTicketsStore.tickets.isEmpty, true);
    });
    test('save_all', () async {
      await testTicketsStore.addAllTickets(listTickets.toSet());
      expect(testTicketsStore.tickets.length, 3);
    });
  });
}

Iterable<TicketWeebi> listTickets = {
  TicketWeebi(
    id: 1,
    shopId: 'entrepot',
    items: [],
    taxe: TaxWeebi.noTax,
    promo: 0.0,
    comment: 'no comment',
    received: 0,
    date: DateTime(2020, 02, 02),
    paiementType: PaiementType.nope,
    ticketType: TicketType.spendDeferred,
    contactInfo: '0',
    status: true,
    statusUpdateDate: DateTime.now(),
    creationDate: DateTime.now(),
    oid: '',
  ),
  TicketWeebi(
      oid: "",
      id: 2,
      shopId: 'entrepot',
      items: [],
      taxe: TaxWeebi.noTax,
      promo: 0.0,
      comment: 'no comment',
      received: 0,
      date: DateTime.now(),
      paiementType: PaiementType.nope,
      ticketType: TicketType.spendDeferred,
      contactInfo: '0',
      status: true,
      statusUpdateDate: DateTime.now(),
      creationDate: DateTime.now(),
      discountAmount: 0),
  TicketWeebi(
      oid: '',
      id: 3,
      shopId: 'entrepot',
      items: [],
      taxe: TaxWeebi.noTax,
      promo: 0.0,
      comment: 'no comment',
      received: 0,
      date: DateTime.now(),
      paiementType: PaiementType.nope,
      ticketType: TicketType.spendDeferred,
      contactInfo: '0',
      status: true,
      statusUpdateDate: DateTime.now(),
      creationDate: DateTime.now(),
      discountAmount: 0),
};
