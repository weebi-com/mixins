import 'package:mixins_weebi/src/instantiate_stores/tickets.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/tickets_filter.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:test/test.dart';

import '../../../models/lib/src/data/tickets_data.dart';

void main() {
  test('test tickets filters', () async {
    final testTicketsStore = TicketsStoreInstantiater.noPersistence;
    final herders = [Herder.defaultHerder, Herder.dummy, Herder.dummy2];
    final added =
        await testTicketsStore.addAllTickets(TestTicketsData().ticketsSet);
    expect(added.isNotEmpty, isTrue);
    final ticketsFilterStore =
        TicketsFilterStore(testTicketsStore, herders.toSet());
    ticketsFilterStore.contactNameOrTel = 'john';
    // ticketsFilterStore.filterTickets();
  });
}
