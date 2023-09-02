// Package imports:
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';

class TicketTypeDash {
  final TicketType ticketType;
  @observable
  bool status;
  TicketTypeDash(this.ticketType, this.status);

  static List<TicketTypeDash> setTicketTypesDash = [
    TicketTypeDash(TicketType.sell, true),
    TicketTypeDash(TicketType.sellDeferred, true),
    TicketTypeDash(TicketType.sellCovered, true),
    TicketTypeDash(TicketType.spend, true),
    TicketTypeDash(TicketType.spendDeferred, true),
    TicketTypeDash(TicketType.spendCovered, true),
    TicketTypeDash(TicketType.stockIn, true),
    TicketTypeDash(TicketType.stockOut, true),
    TicketTypeDash(TicketType.wage, true),
  ];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketTypeDash &&
        other.ticketType == ticketType &&
        other.status == status;
  }

  @override
  int get hashCode => ticketType.hashCode ^ status.hashCode;
}
