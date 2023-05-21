// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_calibre_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleCalibreUpdateFormStore on _ArticleCalibreUpdateFormStore, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ArticleCalibreUpdateFormStore.hasErrors'))
          .value;

  late final _$nameAtom =
      Atom(name: '_ArticleCalibreUpdateFormStore.name', context: context);

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

  late final _$stockUnitAtom =
      Atom(name: '_ArticleCalibreUpdateFormStore.stockUnit', context: context);

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

  late final _$_ArticleCalibreUpdateFormStoreActionController =
      ActionController(
          name: '_ArticleCalibreUpdateFormStore', context: context);

  @override
  void validateArticleCalibreName(String value) {
    final _$actionInfo =
        _$_ArticleCalibreUpdateFormStoreActionController.startAction(
            name: '_ArticleCalibreUpdateFormStore.validateArticleCalibreName');
    try {
      return super.validateArticleCalibreName(value);
    } finally {
      _$_ArticleCalibreUpdateFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
stockUnit: ${stockUnit},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorArticleCalibreUpdateState
    on _FormErrorArticleCalibreUpdateState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorArticleCalibreUpdateState.hasErrors'))
          .value;

  late final _$nameErrorAtom = Atom(
      name: '_FormErrorArticleCalibreUpdateState.nameError', context: context);

  @override
  String get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  @override
  String toString() {
    return '''
nameError: ${nameError},
hasErrors: ${hasErrors}
    ''';
  }
}
