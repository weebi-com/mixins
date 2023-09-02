// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calibrate_create_retail_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleCalibreCreateFormStore on _ArticleCalibreCreateFormStore, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ArticleCalibreCreateFormStore.hasErrors'))
          .value;

  late final _$nameAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$costAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.cost', context: context);

  @override
  String get cost {
    _$costAtom.reportRead();
    return super.cost;
  }

  @override
  set cost(String value) {
    _$costAtom.reportWrite(value, super.cost, () {
      super.cost = value;
    });
  }

  late final _$photoPathAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.photoPath', context: context);

  @override
  String get photoPath {
    _$photoPathAtom.reportRead();
    return super.photoPath;
  }

  @override
  set photoPath(String value) {
    _$photoPathAtom.reportWrite(value, super.photoPath, () {
      super.photoPath = value;
    });
  }

  late final _$stockUnitAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.stockUnit', context: context);

  @override
  StockUnit get stockUnit {
    _$stockUnitAtom.reportRead();
    return super.stockUnit;
  }

  @override
  set stockUnit(StockUnit value) {
    _$stockUnitAtom.reportWrite(value, super.stockUnit, () {
      super.stockUnit = value;
    });
  }

  late final _$unitsPerPieceAtom = Atom(
      name: '_ArticleCalibreCreateFormStore.unitsPerPiece', context: context);

  @override
  String get unitsPerPiece {
    _$unitsPerPieceAtom.reportRead();
    return super.unitsPerPiece;
  }

  @override
  set unitsPerPiece(String value) {
    _$unitsPerPieceAtom.reportWrite(value, super.unitsPerPiece, () {
      super.unitsPerPiece = value;
    });
  }

  late final _$barcodeEANAtom =
      Atom(name: '_ArticleCalibreCreateFormStore.barcodeEAN', context: context);

  @override
  String get barcodeEAN {
    _$barcodeEANAtom.reportRead();
    return super.barcodeEAN;
  }

  @override
  set barcodeEAN(String value) {
    _$barcodeEANAtom.reportWrite(value, super.barcodeEAN, () {
      super.barcodeEAN = value;
    });
  }

  late final _$_ArticleCalibreCreateFormStoreActionController =
      ActionController(
          name: '_ArticleCalibreCreateFormStore', context: context);

  @override
  void validateArticleCalibreName(String value) {
    final _$actionInfo =
        _$_ArticleCalibreCreateFormStoreActionController.startAction(
            name: '_ArticleCalibreCreateFormStore.validateArticleCalibreName');
    try {
      return super.validateArticleCalibreName(value);
    } finally {
      _$_ArticleCalibreCreateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePrice(String value) {
    final _$actionInfo = _$_ArticleCalibreCreateFormStoreActionController
        .startAction(name: '_ArticleCalibreCreateFormStore.validatePrice');
    try {
      return super.validatePrice(value);
    } finally {
      _$_ArticleCalibreCreateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCost(String value) {
    final _$actionInfo = _$_ArticleCalibreCreateFormStoreActionController
        .startAction(name: '_ArticleCalibreCreateFormStore.validateCost');
    try {
      return super.validateCost(value);
    } finally {
      _$_ArticleCalibreCreateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUnitsPerPiece(String value) {
    final _$actionInfo =
        _$_ArticleCalibreCreateFormStoreActionController.startAction(
            name: '_ArticleCalibreCreateFormStore.validateUnitsPerPiece');
    try {
      return super.validateUnitsPerPiece(value);
    } finally {
      _$_ArticleCalibreCreateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
price: ${price},
cost: ${cost},
photoPath: ${photoPath},
stockUnit: ${stockUnit},
unitsPerPiece: ${unitsPerPiece},
barcodeEAN: ${barcodeEAN},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorLineArticleCreateState
    on _FormErrorLineArticleCreateState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorLineArticleCreateState.hasErrors'))
          .value;

  late final _$nameErrorAtom = Atom(
      name: '_FormErrorLineArticleCreateState.nameError', context: context);

  @override
  String? get fullNameError {
    _$nameErrorAtom.reportRead();
    return super.fullNameError;
  }

  @override
  set fullNameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.fullNameError, () {
      super.fullNameError = value;
    });
  }

  late final _$unitsPerPieceErrorAtom = Atom(
      name: '_FormErrorLineArticleCreateState.unitsPerPieceError',
      context: context);

  @override
  String? get unitsPerPieceError {
    _$unitsPerPieceErrorAtom.reportRead();
    return super.unitsPerPieceError;
  }

  @override
  set unitsPerPieceError(String? value) {
    _$unitsPerPieceErrorAtom.reportWrite(value, super.unitsPerPieceError, () {
      super.unitsPerPieceError = value;
    });
  }

  late final _$priceErrorAtom = Atom(
      name: '_FormErrorLineArticleCreateState.priceError', context: context);

  @override
  String? get priceError {
    _$priceErrorAtom.reportRead();
    return super.priceError;
  }

  @override
  set priceError(String? value) {
    _$priceErrorAtom.reportWrite(value, super.priceError, () {
      super.priceError = value;
    });
  }

  late final _$costErrorAtom = Atom(
      name: '_FormErrorLineArticleCreateState.costError', context: context);

  @override
  String? get costError {
    _$costErrorAtom.reportRead();
    return super.costError;
  }

  @override
  set costError(String? value) {
    _$costErrorAtom.reportWrite(value, super.costError, () {
      super.costError = value;
    });
  }

  @override
  String toString() {
    return '''
nameError: ${fullNameError},
unitsPerPieceError: ${unitsPerPieceError},
priceError: ${priceError},
costError: ${costError},
hasErrors: ${hasErrors}
    ''';
  }
}
