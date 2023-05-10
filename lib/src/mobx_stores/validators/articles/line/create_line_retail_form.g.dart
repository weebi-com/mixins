// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_line_retail_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleLineCreateFormStore on _ArticleLineCreateFormStore, Store {
  final _$usernameCheckAtom = Atom(name: '_FormStore.usernameCheck');

  @override
  ObservableFuture<bool> get isArticleCreated {
    _$usernameCheckAtom.reportRead();
    return super.isArticleCreated;
  }

  @override
  set isArticleCreated(ObservableFuture<bool> value) {
    _$usernameCheckAtom.reportWrite(value, super.isArticleCreated, () {
      super.isArticleCreated = value;
    });
  }

  Computed<bool> _$isUserCheckPendingComputed;

  @override
  bool get isArticleCreationPending => (_$isUserCheckPendingComputed ??=
          Computed<bool>(() => super.isArticleCreationPending,
              name: '_FormStore.isArticleCreationPending'))
      .value;

  Computed<bool> _$hasErrors;

  @override
  bool get hasErrors => (_$hasErrors ??= Computed<bool>(() => super.hasErrors,
          name: '_ArticleFormStore.hasErrors'))
      .value;

  final _$nameAtom = Atom(name: '_ArticleFormStore.name');

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

  final _$unitsPerAtom = Atom(name: '_ArticleFormStore.unitsPer');

  @override
  String get unitsPerPiece {
    _$unitsPerAtom.reportRead();
    return super.unitsPerPiece;
  }

  @override
  set unitsPerPiece(String value) {
    _$unitsPerAtom.reportWrite(value, super.unitsPerPiece, () {
      super.unitsPerPiece = value;
    });
  }

  final _$priceAtom = Atom(name: '_ArticleFormStore.price');

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

  final _$costAtom = Atom(name: '_ArticleFormStore.cost');

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

  final _$barcodeEANAtom = Atom(name: '_ArticleFormStore.barcodeEAN');

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

  final _$stockUnitAtom = Atom(name: '_ArticleFormStore.stockUnit');

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

  final _$_ArticleLineCreateFormStore =
      ActionController(name: '_ArticleFormStore');

  @override
  void validatePrice(String value) {
    final _$actionInfo = _$_ArticleLineCreateFormStore.startAction(
        name: '_ArticleFormStore.validatePrice');
    try {
      return super.validatePrice(value);
    } finally {
      _$_ArticleLineCreateFormStore.endAction(_$actionInfo);
    }
  }

  @override
  void validateCost(String value) {
    final _$actionInfo = _$_ArticleLineCreateFormStore.startAction(
        name: '_ArticleFormStore.validateCost');
    try {
      return super.validateCost(value);
    } finally {
      _$_ArticleLineCreateFormStore.endAction(_$actionInfo);
    }
  }

  @override
  void validateUnitsPerPiece(String value) {
    final _$actionInfo = _$_ArticleLineCreateFormStore.startAction(
        name: '_ArticleFormStore.validateUnitsPerPiece');
    try {
      return super.validateUnitsPerPiece(value);
    } finally {
      _$_ArticleLineCreateFormStore.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${unitsPerPiece},
password: ${stockUnit},
usernameCheck: ${isArticleCreated},
canComplete: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorLineArtcileCreateState
    on _FormErrorLineArtcileCreateState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorLineArtcileCreateState.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_FormErrorLineArtcileCreateState.name');

  @override
  String get nameError {
    _$nameAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String value) {
    _$nameAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  final _$unitsPerPieceAtom =
      Atom(name: '_FormErrorLineArtcileCreateState.unitsPerPiece');

  @override
  String get unitsPerPieceError {
    _$unitsPerPieceAtom.reportRead();
    return super.unitsPerPieceError;
  }

  @override
  set unitsPerPieceError(String value) {
    _$unitsPerPieceAtom.reportWrite(value, super.unitsPerPieceError, () {
      super.unitsPerPieceError = value;
    });
  }

  final _$priceAtom = Atom(name: '_FormErrorLineArtcileCreateState.priceError');

  @override
  String get priceError {
    _$priceAtom.reportRead();
    return super.priceError;
  }

  @override
  set priceError(String value) {
    _$priceAtom.reportWrite(value, super.priceError, () {
      super.priceError = value;
    });
  }

  final _$costErrorAtom =
      Atom(name: '_FormErrorLineArtcileCreateState.costError');

  @override
  String get costError {
    _$costErrorAtom.reportRead();
    return super.costError;
  }

  @override
  set costError(String value) {
    _$costErrorAtom.reportWrite(value, super.costError, () {
      super.costError = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${nameError},
unitsPerPiece: ${unitsPerPieceError},
price: ${priceError},
cost: ${costError},
hasErrors: ${hasErrors}
    ''';
  }
}
