import 'package:mobx/mobx.dart';

mixin Validators on FormStoreAbstractArticleRetail {
  @action
  void validatePrice(String value) {
    if (value.isEmpty) {
      errorStore.priceError = 'Saisir le prix de vente';
    } else if (num.tryParse(value) == null) {
      errorStore.priceError = 'erreur $value';
    } else {
      errorStore.priceError = null;
    }
    return;
  }

  @action
  void validateCost(String value) {
    if (value.isNotEmpty && num.tryParse(value) == null) {
      errorStore.costError = 'erreur $value';
    } else {
      errorStore.costError = null;
    }
    return;
  }

  @action
  void validateUnitsPerPiece(String value) {
    if (value.isNotEmpty && double.tryParse(value) == null) {
      errorStore.unitsPerPieceError =
          'erreur $value, exemple : 1.5 et non pas 1,5';
    } else {
      errorStore.unitsPerPieceError = null;
    }
    return;
  }
}

abstract class FormStoreAbstractArticleRetail {
  @observable
  String price = '';
  @observable
  String cost = '';
  @observable
  String name = '';
  @observable
  String unitsPerPiece = '';

  late FormErrorArticleRetailAbstract errorStore;
}

abstract class FormErrorArticleRetailAbstract {
  @observable
  String? priceError, costError, fullNameError, unitsPerPieceError;

  @computed
  bool get hasErrors =>
      fullNameError != null ||
      unitsPerPieceError != null ||
      priceError != null ||
      costError != null;
}
