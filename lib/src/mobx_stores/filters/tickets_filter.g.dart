// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_filter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketsFilterStore on _TicketsFilterStore, Store {
  Computed<bool>? _$isArticleCreationPendingComputed;

  @override
  bool get isSearchPending => (_$isArticleCreationPendingComputed ??=
          Computed<bool>(() => super.isSearchPending,
              name: '_TicketSearchFormStore.isSearchPending'))
      .value;
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_TicketSearchFormStore.hasErrors'))
          .value;

  late final _$fullNameAtom =
      Atom(name: '_TicketSearchFormStore.fullName', context: context);

  @override
  DateRangeW get dateRange {
    _$fullNameAtom.reportRead();
    return super.dateRange;
  }

  @override
  set dateRange(DateRangeW value) {
    _$fullNameAtom.reportWrite(value, super.dateRange, () {
      super.dateRange = value;
    });
  }

  late final _$paiementTypeAtom =
      Atom(name: '_TicketSearchFormStore.paiementType', context: context);

  @override
  ObservableSet<PaiementTypeDash> get paiementTypes {
    _$paiementTypeAtom.reportRead();
    return super.paiementTypes;
  }

  @override
  set paiementTypes(ObservableSet<PaiementTypeDash> value) {
    _$paiementTypeAtom.reportWrite(value, super.paiementTypes, () {
      super.paiementTypes = value;
    });
  }

  late final _$ticketTypeAtom =
      Atom(name: '_TicketSearchFormStore.ticketType', context: context);

  @override
  ObservableSet<TicketTypeDash> get ticketTypes {
    _$ticketTypeAtom.reportRead();
    return super.ticketTypes;
  }

  @override
  set ticketTypes(ObservableSet<TicketTypeDash> value) {
    _$ticketTypeAtom.reportWrite(value, super.ticketTypes, () {
      super.ticketTypes = value;
    });
  }

  late final _$ticketsStatusAtom =
      Atom(name: '_TicketSearchFormStore.ticketsStatus', context: context);

  @override
  Observable<bool> get ticketsStatus {
    _$ticketsStatusAtom.reportRead();
    return super.ticketsStatus;
  }

  @override
  set ticketsStatus(Observable<bool> value) {
    _$ticketsStatusAtom.reportWrite(value, super.ticketsStatus, () {
      super.ticketsStatus = value;
    });
  }

  late final _$isfilteringCompletedAtom = Atom(
      name: '_TicketSearchFormStore.isfilteringCompleted', context: context);

  @override
  ObservableFuture<bool> get isfilteringCompleted {
    _$isfilteringCompletedAtom.reportRead();
    return super.isfilteringCompleted;
  }

  @override
  set isfilteringCompleted(ObservableFuture<bool> value) {
    _$isfilteringCompletedAtom.reportWrite(value, super.isfilteringCompleted,
        () {
      super.isfilteringCompleted = value;
    });
  }

  late final _$_TicketSearchFormStore =
      ActionController(name: '_TicketSearchFormStore', context: context);

  @override
  void filterByDateRange(DateRangeW value) {
    final _$actionInfo = _$_TicketSearchFormStore.startAction(
        name: '_TicketSearchFormStore.filterByDateRange');
    try {
      return super.filterByDateRange(value);
    } finally {
      _$_TicketSearchFormStore.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateRange: ${dateRange},
paiementType: ${paiementTypes},
ticketType: ${ticketTypes},
isArticleCreated: ${ticketsStatus},
isArticleCreationPending: ${isSearchPending},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$SearchFieldFormErrorCreateState
    on _SearchFieldFormErrorCreateState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_SearchFieldFormErrorCreateState.hasErrors'))
          .value;

  @override
  String toString() {
    return '''
hasErrors: ${hasErrors}
    ''';
  }
}
