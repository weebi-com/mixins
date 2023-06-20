import 'package:mixins_weebi/src/mobx_stores/tickets.dart';
import 'package:services_weebi/db_wrappers.dart';
import 'package:services_weebi/services_weebi.dart';

class TicketsStoreInstantiater {
  static TicketsStore get noPersistence =>
      TicketsStore(TicketsServiceInstantiater.noPersistence);

  static TicketsStore instTicketsStoreSembast(DbTickets db) =>
      TicketsStore(TicketsServiceInstantiater.instTicketsStoreSembast(db));
}
