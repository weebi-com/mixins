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
    PaiementTypeDash(PaiementType.nope, true),
    PaiementTypeDash(PaiementType.mobileMoney, true),
    // * not visibile yet
    // PaiementTypeDash(PaiementType.cb, true),
    // PaiementTypeDash(PaiementType.cheque, true),
  ];
  static List<PaiementTypeDash> setPaiementTypesDashFalse = [
    PaiementTypeDash(PaiementType.cash, false),
    PaiementTypeDash(PaiementType.nope, false),
    PaiementTypeDash(PaiementType.mobileMoney, false),
    // * not visibile yet
    // PaiementTypeDash(PaiementType.cb, false),
    // PaiementTypeDash(PaiementType.cheque, false),
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
