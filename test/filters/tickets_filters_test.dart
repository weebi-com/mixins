import 'package:mixins_weebi/src/instantiate_stores/tickets.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/tickets_filter.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:test/test.dart';

import '../../../models/lib/src/data/tickets_data.dart';

// TODO: add use case with cumulated field
// ex:  emptying types while searching for a ticketId

void main() {
  test('test tickets filters', () async {
    final testTicketsStore = TicketsStoreInstantiater.noPersistence;
    final herders = [Herder.defaultHerder, Herder.dummy, Herder.dummy2];
    // [ArticleCalibre.dummyRetail, Herder.dummy, Herder.dummy2];
    final added =
        await testTicketsStore.addAllTickets(TestTicketsData().ticketsSet);
    expect(added.isNotEmpty, isTrue);
    final ticketsFilterStore = TicketsFilterStore(
      testTicketsStore,
      herders.toSet(),
    );
    ticketsFilterStore.setupFilters();
    ticketsFilterStore.contactNameOrTel = 'john';
    ticketsFilterStore.filteredTickets.length;
    expect(ticketsFilterStore.filteredTickets.length, 1);
    ticketsFilterStore.contactNameOrTel = '';
    expect(ticketsFilterStore.filteredTickets.length, 3); // 0
    ticketsFilterStore.articleName = 'dummy';
    expect(ticketsFilterStore.filteredTickets.length, 2);
  });
}
