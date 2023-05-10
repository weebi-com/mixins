// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_line_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleFormStore on _ArticleLineUpdateFormStore, Store {
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

  @override
  String toString() {
    return '''
name: ${name},
password: ${stockUnit},
canComplete: ${hasErrors}
    ''';
  }
}

mixin _$FormErrorArticleLineUpdateState
    on _FormErrorArticleLineUpdateState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorArticleLineUpdateState.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_FormErrorArticleLineUpdateState.name');

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

  @override
  String toString() {
    return '''
username: ${nameError},
hasErrors: ${hasErrors}
    ''';
  }
}
