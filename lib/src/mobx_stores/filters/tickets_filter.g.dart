// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_filter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketsFilterStore on _TicketsFilterStore, Store {
  Computed<ObservableSet<TicketType>>? _$selectedTicketTypeComputed;

  @override
  ObservableSet<TicketType> get ticketTypesComputed =>
      (_$selectedTicketTypeComputed ??= Computed<ObservableSet<TicketType>>(
              () => super.ticketTypesComputed,
              name: '_TicketsFilterStore.selectedTicketType'))
          .value;
  Computed<ObservableSet<PaiementType>>? _$selectedPaiementTypeComputed;

  @override
  ObservableSet<PaiementType> get paiementTypesComputed =>
      (_$selectedPaiementTypeComputed ??= Computed<ObservableSet<PaiementType>>(
              () => super.paiementTypesComputed,
              name: '_TicketsFilterStore.selectedPaiementType'))
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
  ObservableSet<PaiementType> get paiementTypes {
    _$paiementTypesDashAtom.reportRead();
    return super.paiementTypes;
  }

  @override
  set paiementTypes(ObservableSet<PaiementType> value) {
    _$paiementTypesDashAtom.reportWrite(value, super.paiementTypes, () {
      super.paiementTypes = value;
    });
  }

  late final _$ticketTypesDashAtom =
      Atom(name: '_TicketsFilterStore.ticketTypesDash', context: context);

  @override
  ObservableSet<TicketType> get ticketTypes {
    _$ticketTypesDashAtom.reportRead();
    return super.ticketTypes;
  }

  @override
  set ticketTypes(ObservableSet<TicketType> value) {
    _$ticketTypesDashAtom.reportWrite(value, super.ticketTypes, () {
      super.ticketTypes = value;
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

  late final _$articleNameAtom =
      Atom(name: '_TicketsFilterStore.articleName', context: context);

  @override
  String get articleName {
    _$articleNameAtom.reportRead();
    return super.articleName;
  }

  @override
  set articleName(String value) {
    _$articleNameAtom.reportWrite(value, super.articleName, () {
      super.articleName = value;
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
  TimeOfDayDart get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(TimeOfDayDart value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_TicketsFilterStore.endTime', context: context);

  @override
  TimeOfDayDart get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(TimeOfDayDart value) {
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
  void filterByTicketTypes(ObservableSet<TicketType> ticketTypesDash) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByTicketTypes');
    try {
      return super.filterByTicketTypes(ticketTypesDash);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByPaiementTypes(ObservableSet<PaiementType> paiementTypesDash) {
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
  void filterByArticleName(String queryString) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.filterByArticleName');
    try {
      return super.filterByArticleName(queryString);
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
  dynamic setStartTime(TimeOfDayDart _time) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.setStartTime');
    try {
      return super.setStartTime(_time);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndTime(TimeOfDayDart _time) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.setEndTime');
    try {
      return super.setEndTime(_time);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  TicketType switchTicketType(TicketType data, bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchTicketType');
    try {
      return super.switchTicketType(data, _status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableSet<TicketType> switchAllTicketTypes(bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchAllTicketTypes');
    try {
      return super.switchAllTicketTypes(_status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaiementType switchPaiementTypes(PaiementType data, bool _status) {
    final _$actionInfo = _$_TicketsFilterStoreActionController.startAction(
        name: '_TicketsFilterStore.switchPaiementTypes');
    try {
      return super.switchPaiementTypes(data, _status);
    } finally {
      _$_TicketsFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableSet<PaiementType> switchAllPaiementTypes(bool _status) {
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
paiementTypesDash: ${paiementTypes},
ticketTypesDash: ${ticketTypes},
ticketsStatus: ${ticketsStatus},
ticketsIdFromTextField: ${ticketsIdFromTextField},
contactNameOrTel: ${contactNameOrTel},
idsDateRange: ${idsDateRange},
idsContact: ${idsContact},
idsFromTicketIdTextField: ${idsFromTicketIdTextField},
idsTicketTypes: ${idsTicketTypes},
idsPaiementTypes: ${idsPaiementTypes},
idsStatus: ${idsStatus},
timespan: ${timespan},
startTime: ${startTime},
endTime: ${endTime},
filteredIds: ${filteredIds},
filteredTickets: ${filteredTickets},
    ''';
  }
}
