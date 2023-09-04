// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_filter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketsFilterStore on _TicketsFilterStore, Store {
  Computed<bool>? _$isSearchPendingComputed;

  @override
  bool get isSearchPending =>
      (_$isSearchPendingComputed ??= Computed<bool>(() => super.isSearchPending,
              name: '_TicketsFilterStore.isSearchPending'))
          .value;
  Computed<ObservableSet<TicketTypeDash>>? _$selectedTicketTypeDashComputed;

  @override
  ObservableSet<TicketTypeDash> get selectedTicketTypeDash =>
      (_$selectedTicketTypeDashComputed ??=
              Computed<ObservableSet<TicketTypeDash>>(
                  () => super.selectedTicketTypeDash,
                  name: '_TicketsFilterStore.selectedTicketTypeDash'))
          .value;
  Computed<ObservableSet<PaiementTypeDash>>? _$selectedPaiementTypeDashComputed;

  @override
  ObservableSet<PaiementTypeDash> get selectedPaiementTypeDash =>
      (_$selectedPaiementTypeDashComputed ??=
              Computed<ObservableSet<PaiementTypeDash>>(
                  () => super.selectedPaiementTypeDash,
                  name: '_TicketsFilterStore.selectedPaiementTypeDash'))
          .value;
  Computed<ObservableSet<int>>? _$filteredIdsComputed;

  @override
  ObservableSet<int> get filteredIds => (_$filteredIdsComputed ??=
          Computed<ObservableSet<int>>(() => super.filteredIds,
              name: '_TicketsFilterStore.filteredIds'))
      .value;
  Computed<ObservableSet<TicketWeebi>>? _$filteredTicketsComputed;

  @override
  ObservableSet<TicketWeebi> get filteredTickets =>
      (_$filteredTicketsComputed ??= Computed<ObservableSet<TicketWeebi>>(
              () => super.filteredTickets,
              name: '_TicketsFilterStore.filteredTickets'))
          .value;
  Computed<bool?>? _$areTicketTypesSelectedComputed;

  @override
  bool? get areTicketTypesSelected => (_$areTicketTypesSelectedComputed ??=
          Computed<bool?>(() => super.areTicketTypesSelected,
              name: '_TicketsFilterStore.areTicketTypesSelected'))
      .value;
  Computed<bool?>? _$arePaiementTypesSelectedComputed;

  @override
  bool? get arePaiementTypesSelected => (_$arePaiementTypesSelectedComputed ??=
          Computed<bool?>(() => super.arePaiementTypesSelected,
              name: '_TicketsFilterStore.arePaiementTypesSelected'))
      .value;

  late final _$dateRangeAtom =
      Atom(name: '_TicketsFilterStore.dateRange', context: context);

  @override
  DateRangeW get dateRange {
    _$dateRangeAtom.reportRead();
    return super.dateRange;
  }

  @override
  set dateRange(DateRangeW value) {
    _$dateRangeAtom.reportWrite(value, super.dateRange, () {
      super.dateRange = value;
    });
  }

  late final _$paiementTypesDashAtom =
      Atom(name: '_TicketsFilterStore.paiementTypesDash', context: context);

  @override
  ObservableSet<PaiementTypeDash> get paiementTypesDash {
    _$paiementTypesDashAtom.reportRead();
    return super.paiementTypesDash;
  }

  @override
  set paiementTypesDash(ObservableSet<PaiementTypeDash> value) {
    _$paiementTypesDashAtom.reportWrite(value, super.paiementTypesDash, () {
      super.paiementTypesDash = value;
    });
  }

  late final _$ticketTypesDashAtom =
      Atom(name: '_TicketsFilterStore.ticketTypesDash', context: context);

  @override
  ObservableSet<TicketTypeDash> get ticketTypesDash {
    _$ticketTypesDashAtom.reportRead();
    return super.ticketTypesDash;
  }

  @override
  set ticketTypesDash(ObservableSet<TicketTypeDash> value) {
    _$ticketTypesDashAtom.reportWrite(value, super.ticketTypesDash, () {
      super.ticketTypesDash = value;
    });
  }

  late final _$ticketsStatusAtom =
      Atom(name: '_TicketsFilterStore.ticketsStatus', context: context);

  @override
  Tristate get ticketsStatus {
    _$ticketsStatusAtom.reportRead();
    return super.ticketsStatus;
  }

  @override
  set ticketsStatus(Tristate value) {
    _$ticketsStatusAtom.reportWrite(value, super.ticketsStatus, () {
      super.ticketsStatus = value;
    });
  }

  late final _$ticketsIdFromTextFieldAtom = Atom(
      name: '_TicketsFilterStore.ticketsIdFromTextField', context: context);

  @override
  String get ticketsIdFromTextField {
    _$ticketsIdFromTextFieldAtom.reportRead();
    return super.ticketsIdFromTextField;
  }

  @override
  set ticketsIdFromTextField(String value) {
    _$ticketsIdFromTextFieldAtom
        .reportWrite(value, super.ticketsIdFromTextField, () {
      super.ticketsIdFromTextField = value;
    });
  }

  late final _$contactNameOrTelAtom =
      Atom(name: '_TicketsFilterStore.contactNameOrTel', context: context);

  @override
  String get contactNameOrTel {
    _$contactNameOrTelAtom.reportRead();
    return super.contactNameOrTel;
  }

  @override
  set contactNameOrTel(String value) {
    _$contactNameOrTelAtom.reportWrite(value, super.contactNameOrTel, () {
      super.contactNameOrTel = value;
    });
  }

  late final _$isfilteringCompletedAtom =
      Atom(name: '_TicketsFilterStore.isfilteringCompleted', context: context);

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

  late final _$idsDateRangeAtom =
      Atom(name: '_TicketsFilterStore.idsDateRange', context: context);

  @override
  ObservableSet<int> get idsDateRange {
    _$idsDateRangeAtom.reportRead();
    return super.idsDateRange;
  }

  @override
  set idsDateRange(ObservableSet<int> value) {
    _$idsDateRangeAtom.reportWrite(value, super.idsDateRange, () {
      super.idsDateRange = value;
    });
  }

  late final _$idsContactAtom =
      Atom(name: '_TicketsFilterStore.idsContact', context: context);

  @override
  ObservableSet<int> get idsContact {
    _$idsContactAtom.reportRead();
    return super.idsContact;
  }

  @override
  set idsContact(ObservableSet<int> value) {
    _$idsContactAtom.reportWrite(value, super.idsContact, () {
      super.idsContact = value;
    });
  }

  late final _$idsFromTicketIdTextFieldAtom = Atom(
      name: '_TicketsFilterStore.idsFromTicketIdTextField', context: context);

  @override
  ObservableSet<int> get idsFromTicketIdTextField {
    _$idsFromTicketIdTextFieldAtom.reportRead();
    return super.idsFromTicketIdTextField;
  }

  @override
  set idsFromTicketIdTextField(ObservableSet<int> value) {
    _$idsFromTicketIdTextFieldAtom
        .reportWrite(value, super.idsFromTicketIdTextField, () {
      super.idsFromTicketIdTextField = value;
    });
  }

  late final _$idsTicketTypesAtom =
      Atom(name: '_TicketsFilterStore.idsTicketTypes', context: context);

  @override
  ObservableSet<int> get idsTicketTypes {
    _$idsTicketTypesAtom.reportRead();
    return super.idsTicketTypes;
  }

  @override
  set idsTicketTypes(ObservableSet<int> value) {
    _$idsTicketTypesAtom.reportWrite(value, super.idsTicketTypes, () {
      super.idsTicketTypes = value;
    });
  }

  late final _$idsPaiementTypesAtom =
      Atom(name: '_TicketsFilterStore.idsPaiementTypes', context: context);

  @override
  ObservableSet<int> get idsPaiementTypes {
    _$idsPaiementTypesAtom.reportRead();
    return super.idsPaiementTypes;
  }

  @override
  set idsPaiementTypes(ObservableSet<int> value) {
    _$idsPaiementTypesAtom.reportWrite(value, super.idsPaiementTypes, () {
      super.idsPaiementTypes = value;
    });
  }

  late final _$idsStatusAtom =
      Atom(name: '_TicketsFilterStore.idsStatus', context: context);

  @override
  ObservableSet<int> get idsStatus {
    _$idsStatusAtom.reportRead();
    return super.idsStatus;
  }

  @override
  set idsStatus(ObservableSet<int> value) {
    _$idsStatusAtom.reportWrite(value, super.idsStatus, () {
      super.idsStatus = value;
    });
  }

  late final _$timespanAtom =
      Atom(name: '_TicketsFilterStore.timespan', context: context);

  @override
  Timespan get timespan {
    _$timespanAtom.reportRead();
    return super.timespan;
  }

  @override
  set timespan(Timespan value) {
    _$timespanAtom.reportWrite(value, super.timespan, () {
      super.timespan = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_TicketsFilterStore.startTime', context: context);

  @override
  TimeOfDay get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(TimeOfDay value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_TicketsFilterStore.endTime', context: context);

  @override
  TimeOfDay get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(TimeOfDay value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$_TicketsFilterStoreActionController =
      ActionController(name: '_TicketsFilterStore', context: context);

  @override
  Tristate switchStatus(Tristate _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchStatus');
    try {
      return super.switchStatus(_status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByDateRange(DateRangeW dateRange) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByDateRange');
    try {
      return super.filterByDateRange(dateRange);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByTicketTypes(ObservableSet<TicketTypeDash> ticketTypesDash) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByTicketTypes');
    try {
      return super.filterByTicketTypes(ticketTypesDash);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByPaiementTypes(
      ObservableSet<PaiementTypeDash> paiementTypesDash) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByPaiementTypes');
    try {
      return super.filterByPaiementTypes(paiementTypesDash);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByTicketStatus(Tristate ticketsStatus) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByTicketStatus');
    try {
      return super.filterByTicketStatus(ticketsStatus);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByContact(String queryString) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByContact');
    try {
      return super.filterByContact(queryString);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterById(String queryString) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterById');
    try {
      return super.filterById(queryString);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTimespan(Timespan t) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.setTimespan');
    try {
      return super.setTimespan(t);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStartTime(TimeOfDay _time) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.setStartTime');
    try {
      return super.setStartTime(_time);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndTime(TimeOfDay _time) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.setEndTime');
    try {
      return super.setEndTime(_time);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  TicketTypeDash switchTicketType(TicketTypeDash data, bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchTicketType');
    try {
      return super.switchTicketType(data, _status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableSet<TicketTypeDash> switchAllTicketTypes(bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchAllTicketTypes');
    try {
      return super.switchAllTicketTypes(_status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaiementTypeDash switchPaiementTypes(PaiementTypeDash data, bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchPaiementTypes');
    try {
      return super.switchPaiementTypes(data, _status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableSet<PaiementTypeDash> switchAllPaiementTypes(bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchAllPaiementTypes');
    try {
      return super.switchAllPaiementTypes(_status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateRange: ${dateRange},
paiementTypesDash: ${paiementTypesDash},
ticketTypesDash: ${ticketTypesDash},
ticketsStatus: ${ticketsStatus},
ticketsIdFromTextField: ${ticketsIdFromTextField},
contactNameOrTel: ${contactNameOrTel},
isfilteringCompleted: ${isfilteringCompleted},
idsDateRange: ${idsDateRange},
idsContact: ${idsContact},
idsFromTicketIdTextField: ${idsFromTicketIdTextField},
idsTicketTypes: ${idsTicketTypes},
idsPaiementTypes: ${idsPaiementTypes},
idsStatus: ${idsStatus},
timespan: ${timespan},
startTime: ${startTime},
endTime: ${endTime},
isSearchPending: ${isSearchPending},
selectedTicketTypeDash: ${selectedTicketTypeDash},
selectedPaiementTypeDash: ${selectedPaiementTypeDash},
filteredIds: ${filteredIds},
filteredTickets: ${filteredTickets},
areTicketTypesSelected: ${areTicketTypesSelected},
arePaiementTypesSelected: ${arePaiementTypesSelected}
    ''';
  }
}
