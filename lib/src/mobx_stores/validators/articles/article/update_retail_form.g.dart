// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_retail_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleRetailUpdateFormStore on _ArticleRetailUpdateFormStore, Store {
  Computed<bool>? _$isArticleCreationPendingComputed;

  @override
  bool get isArticleCreationPending => (_$isArticleCreationPendingComputed ??=
          Computed<bool>(() => super.isArticleCreationPending,
              name: '_ArticleRetailUpdateFormStore.isArticleCreationPending'))
      .value;
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ArticleRetailUpdateFormStore.hasErrors'))
          .value;

  late final _$fullNameAtom =
      Atom(name: '_ArticleRetailUpdateFormStore.fullName', context: context);

  @override
  String get name {
    _$fullNameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$fullNameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_ArticleRetailUpdateFormStore.price', context: context);

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
      Atom(name: '_ArticleRetailUpdateFormStore.cost', context: context);

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

  late final _$unitsPerPieceAtom = Atom(
      name: '_ArticleRetailUpdateFormStore.unitsPerPiece', context: context);

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
      Atom(name: '_ArticleRetailUpdateFormStore.barcodeEAN', context: context);

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

  late final _$photoPathAtom =
      Atom(name: '_ArticleRetailUpdateFormStore.photoPath', context: context);

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

  late final _$photoSourceAtom =
      Atom(name: '_ArticleRetailUpdateFormStore.photoSource', context: context);

  @override
  PhotoSource get photoSource {
    _$photoSourceAtom.reportRead();
    return super.photoSource;
  }

  @override
  set photoSource(PhotoSource value) {
    _$photoSourceAtom.reportWrite(value, super.photoSource, () {
      super.photoSource = value;
    });
  }

  late final _$isArticleCreatedAtom = Atom(
      name: '_ArticleRetailUpdateFormStore.isArticleCreated', context: context);

  @override
  ObservableFuture<bool> get isArticleCreated {
    _$isArticleCreatedAtom.reportRead();
    return super.isArticleCreated;
  }

  @override
  set isArticleCreated(ObservableFuture<bool> value) {
    _$isArticleCreatedAtom.reportWrite(value, super.isArticleCreated, () {
      super.isArticleCreated = value;
    });
  }

  late final _$_ArticleRetailUpdateFormStoreActionController =
      ActionController(name: '_ArticleRetailUpdateFormStore', context: context);

  @override
  void validateArticleFullNameOnUpdate(String value) {
    final _$actionInfo =
        _$_ArticleRetailUpdateFormStoreActionController.startAction(
            name:
                '_ArticleRetailUpdateFormStore.validateArticleFullNameOnUpdate');
    try {
      return super.validateArticleFullNameOnUpdate(value);
    } finally {
      _$_ArticleRetailUpdateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePrice(String value) {
    final _$actionInfo = _$_ArticleRetailUpdateFormStoreActionController
        .startAction(name: '_ArticleRetailUpdateFormStore.validatePrice');
    try {
      return super.validatePrice(value);
    } finally {
      _$_ArticleRetailUpdateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCost(String value) {
    final _$actionInfo = _$_ArticleRetailUpdateFormStoreActionController
        .startAction(name: '_ArticleRetailUpdateFormStore.validateCost');
    try {
      return super.validateCost(value);
    } finally {
      _$_ArticleRetailUpdateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUnitsPerPiece(String value) {
    final _$actionInfo =
        _$_ArticleRetailUpdateFormStoreActionController.startAction(
            name: '_ArticleRetailUpdateFormStore.validateUnitsPerPiece');
    try {
      return super.validateUnitsPerPiece(value);
    } finally {
      _$_ArticleRetailUpdateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullName: ${name},
price: ${price},
cost: ${cost},
unitsPerPiece: ${unitsPerPiece},
barcodeEAN: ${barcodeEAN},
photoPath: ${photoPath},
photoSource: ${photoSource},
isArticleCreated: ${isArticleCreated},
isArticleCreationPending: ${isArticleCreationPending},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorArticleRetailUpdateState
    on _FormErrorArticleRetailUpdateState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorArticleRetailUpdateState.hasErrors'))
          .value;

  late final _$fullNameErrorAtom = Atom(
      name: '_FormErrorArticleRetailUpdateState.fullNameError',
      context: context);

  @override
  String? get fullNameError {
    _$fullNameErrorAtom.reportRead();
    return super.fullNameError;
  }

  @override
  set fullNameError(String? value) {
    _$fullNameErrorAtom.reportWrite(value, super.fullNameError, () {
      super.fullNameError = value;
    });
  }

  late final _$unitsPerPieceErrorAtom = Atom(
      name: '_FormErrorArticleRetailUpdateState.unitsPerPieceError',
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
      name: '_FormErrorArticleRetailUpdateState.priceError', context: context);

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
      name: '_FormErrorArticleRetailUpdateState.costError', context: context);

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
fullNameError: ${fullNameError},
unitsPerPieceError: ${unitsPerPieceError},
priceError: ${priceError},
costError: ${costError},
hasErrors: ${hasErrors}
    ''';
  }
}
