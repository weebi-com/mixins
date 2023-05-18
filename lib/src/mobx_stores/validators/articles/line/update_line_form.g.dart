// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_line_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleLineUpdateFormStore on _ArticleLineUpdateFormStore, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ArticleLineUpdateFormStore.hasErrors'))
          .value;

  late final _$nameAtom =
      Atom(name: '_ArticleLineUpdateFormStore.name', context: context);

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
      Atom(name: '_ArticleLineUpdateFormStore.stockUnit', context: context);

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

  late final _$_ArticleLineUpdateFormStoreActionController =
      ActionController(name: '_ArticleLineUpdateFormStore', context: context);

  @override
  void validateArticleLineName(String value) {
    final _$actionInfo =
        _$_ArticleLineUpdateFormStoreActionController.startAction(
            name: '_ArticleLineUpdateFormStore.validateArticleLineName');
    try {
      return super.validateArticleLineName(value);
    } finally {
      _$_ArticleLineUpdateFormStoreActionController.endAction(_$actionInfo);
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

mixin _$FormErrorArticleLineUpdateState
    on _FormErrorArticleLineUpdateState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorArticleLineUpdateState.hasErrors'))
          .value;

  late final _$nameErrorAtom = Atom(
      name: '_FormErrorArticleLineUpdateState.nameError', context: context);

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
