// // Package imports:
// import 'package:mobx/mobx.dart';
// import 'package:models_weebi/common.dart';

// class TicketTypeDash {
//   final TicketType ticketType;
//   @observable
//   bool status;
//   TicketTypeDash(this.ticketType, this.status);

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is TicketTypeDash &&
//         other.ticketType == ticketType &&
//         other.status == status;
//   }

//   @override
//   int get hashCode => ticketType.hashCode ^ status.hashCode;
// }
