import 'package:mixins_weebi/src/mobx_stores/tickets.dart';
import 'package:models_weebi/db.dart';
import 'package:services_weebi/rpc_tickets.dart';
import 'package:services_weebi/services_weebi.dart';

class TicketsStoreInstantiater {
  static TicketsStore get noPersistence {
    const ticketsServiceNoSembast = TicketsServiceNoSembast();
    return TicketsStore(ticketsServiceNoSembast);
  }

  static TicketsStore instTicketsStoreSembast(DbTickets db) {
    final AddTicketRpc createTicketRpc = AddTicketRpc(db);
    final DisableTicketRpc disableTicketRpc = DisableTicketRpc(db);
    final GetAllTicketsRpc getTicketsRpc = GetAllTicketsRpc(db);
    final RestoreTicketRpc restoreTicketRpc = RestoreTicketRpc(db);
    final DeleteAllTicketsRpc deleteAllTicketsRpc = DeleteAllTicketsRpc(db);
    final AddAllTicketsRpc saveAllTicketsRpc = AddAllTicketsRpc(db);
    final DeleteTicketRpc deleteTicketRpc = DeleteTicketRpc(db);

    final TicketsService ticketsService = TicketsService(
      createTicketRpc,
      disableTicketRpc,
      getTicketsRpc,
      restoreTicketRpc,
      saveAllTicketsRpc,
      deleteAllTicketsRpc,
      deleteTicketRpc,
    );

    return TicketsStore(ticketsService);
  }
}
