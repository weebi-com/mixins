// Package imports:
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';

class PaiementTypeDash {
  final PaiementType paiementType;
  @observable
  bool status;
  PaiementTypeDash(this.paiementType, this.status);

  static List<PaiementTypeDash> setPaiementTypesDash = [
    PaiementTypeDash(PaiementType.cash, true),
    PaiementTypeDash(PaiementType.cb, true),
    PaiementTypeDash(PaiementType.cheque, true),
    PaiementTypeDash(PaiementType.mobileMoney, true),
    PaiementTypeDash(PaiementType.nope, true),
  ];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaiementTypeDash &&
        other.paiementType == PaiementType &&
        other.status == status;
  }

  @override
  int get hashCode => paiementType.hashCode ^ status.hashCode;
}
