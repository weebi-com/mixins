import 'package:mixins_weebi/src/instantiate_stores/tickets.dart';
import 'package:test/test.dart';

import '../../models/lib/src/data/tickets_data.dart';

Future main() async {
  final testTicketsStore = TicketsStoreInstantiater.noPersistence;

  group('test tickets store', () {
    test('create ticket & disable & restore  ', () async {
      //final createdTicket =
      final t = await testTicketsStore.addTicket(TestTicketsData().ticket1);
      final t2 = await testTicketsStore.addTicket(TestTicketsData().ticket2);
      expect(t, TestTicketsData().ticket1);
      expect(t2, TestTicketsData().ticket2);
      expect(testTicketsStore.tickets.length, 2);
      final disabledTicket =
          await testTicketsStore.disableTicket(TestTicketsData().ticket1);
      expect(testTicketsStore.tickets.length, 2);
      expect(disabledTicket.status, false);
      final restoredTicket =
          await testTicketsStore.restoreTicket(TestTicketsData().ticket1);
      expect(testTicketsStore.tickets.length, 2);
      expect(restoredTicket.status, true);
    });

    test('delete_all', () async {
      await testTicketsStore.deleteAllTickets();
      expect(testTicketsStore.tickets.isEmpty, true);
    });
    test('save_all', () async {
      await testTicketsStore.addAllTickets(TestTicketsData().ticketsSet);
      expect(testTicketsStore.tickets.length, 3);
    });
  });
}
