// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TicketsStore on TicketsStoreBase, Store {
  final _$TicketsStoreBaseActionController =
      ActionController(name: 'TicketsStoreBase');

  late Computed<ObservableList<TicketWeebi>> _$selectedComputed;
  @override
  ObservableList<TicketWeebi> get selected => (_$selectedComputed ??=
          Computed<ObservableList<TicketWeebi>>(() => super.selected,
              name: '_TicketsStore.selected'))
      .value;

  late Computed<ObservableList<TicketWeebi>> _$selectedNoStockComputed;
  @override
  ObservableList<TicketWeebi> get selectedNoStock =>
      (_$selectedNoStockComputed ??= Computed<ObservableList<TicketWeebi>>(
              () => super.selectedNoStock,
              name: '_TicketsStore.selectedNoStock'))
          .value;

  late Computed<TimeFrame> _$timeFrame;
  @override
  TimeFrame get timeFrame =>
      (_$timeFrame ??= Computed<TimeFrame>(() => super.timeFrame,
              name: '_TicketsStore.timeFrame'))
          .value;
  final _$rangeAtom = Atom(name: '_TicketsStore.timeFrame');

  @override
  Observable<DateTimeRange> get range {
    _$rangeAtom.reportRead();
    return super.range;
  }

  @override
  set range(Observable<DateTimeRange> value) {
    _$rangeAtom.reportWrite(value, super.range, () {
      super.range = value;
    });
  }

  @override
  Observable<DateTimeRange> setRange(DateTimeRange _range) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: '_TicketsStore.setRange');
    try {
      return super.setRange(_range);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  final _$ticketsAtom = Atom(name: 'TicketsStoreBase.tickets');
  @override
  ObservableSet<TicketWeebi> get tickets {
    _$ticketsAtom.reportRead();
    return super.tickets;
  }

  @override
  set tickets(ObservableSet<TicketWeebi> value) {
    _$ticketsAtom.reportWrite(value, super.tickets, () {
      super.tickets = value;
    });
  }

  final _$listOfTicketsByDayAtom =
      Atom(name: 'TicketsStoreBase.listOfTicketsByDay');
  @override
  ObservableList<TicketsGroupedByTimeFrame> get listOfTicketsByTimeFrame {
    _$listOfTicketsByDayAtom.reportRead();
    return super.listOfTicketsByTimeFrame;
  }

  @override
  set listOfTicketsByTimeFrame(
      ObservableList<TicketsGroupedByTimeFrame> value) {
    _$listOfTicketsByDayAtom.reportWrite(value, super.tickets, () {
      super.listOfTicketsByTimeFrame = value;
    });
  }

  final _$initialLoadingAtom = Atom(name: 'TicketsStoreBase.initialLoading');

  @override
  bool get initialLoading {
    _$initialLoadingAtom.reportRead();
    return super.initialLoading;
  }

  @override
  set initialLoading(bool value) {
    _$initialLoadingAtom.reportWrite(value, super.initialLoading, () {
      super.initialLoading = value;
    });
  }

  final _$nowAtom = Atom(name: 'TicketsStoreBase.now');

  @override
  DateTime get now {
    _$nowAtom.reportRead();
    return super.now;
  }

  @override
  set now(DateTime value) {
    _$nowAtom.reportWrite(value, super.now, () {
      super.now = value;
    });
  }

  final _$initAsyncAction = AsyncAction('TicketsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$addAllTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.addAllTickets');

  @override
  Future<Set<TicketWeebi>> addAllTickets(Set<TicketWeebi> daTickets) {
    return _$addAllTicketsAsyncAction.run(() => super.addAllTickets(daTickets));
  }

  final _$importPastTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.importPastTickets');

  @override
  Future<ObservableSet<TicketWeebi>> importPastTickets(String json) {
    return _$importPastTicketsAsyncAction
        .run(() => super.importPastTickets(json));
  }

  final _$addTicketAsyncAction = AsyncAction('TicketsStoreBase.addTicket');

  @override
  Future<TicketWeebi> addTicket(TicketWeebi ticketData) {
    return _$addTicketAsyncAction.run(() => super.addTicket(ticketData));
  }

  final _$deleteTicketAsyncAction =
      AsyncAction('TicketsStoreBase.deleteTicket');

  @override
  Future<ObservableSet<TicketWeebi>> deleteTicket(TicketWeebi ticketData) {
    return _$deleteTicketAsyncAction.run(() => super.deleteTicket(ticketData));
  }

  final _$disableTicketAsyncAction =
      AsyncAction('TicketsStoreBase.disableTicket');

  @override
  Future<TicketWeebi> disableTicket(TicketWeebi ticketData) {
    return _$disableTicketAsyncAction
        .run(() => super.disableTicket(ticketData));
  }

  final _$restoreTicketAsyncAction =
      AsyncAction('TicketsStoreBase.restoreTicket');

  final _$isChangeAtom = Atom(name: 'TicketsStoreBase.isChange');

  @override
  Observable<bool> get isChange {
    _$isChangeAtom.reportRead();
    return super.isChange;
  }

  @override
  set isChange(Observable<bool> value) {
    _$isChangeAtom.reportWrite(value, super.isChange, () {
      super.isChange = value;
    });
  }

  @override
  void setChange() {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.setChange');
    try {
      return super.setChange();
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<TicketWeebi> restoreTicket(TicketWeebi ticketData) {
    return _$restoreTicketAsyncAction
        .run(() => super.restoreTicket(ticketData));
  }

  final _$deleteAllTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.deleteAllTickets');

  @override
  Future<void> deleteAllTickets() {
    return _$deleteAllTicketsAsyncAction.run(() => super.deleteAllTickets());
  }

  @override
  ObservableSet<TicketWeebi> searchTicketById(String queryString) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.searchTicketById');
    try {
      return super.searchTicketById(queryString);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todayTicketCount(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todayTicketCount');
    try {
      return super.todayTicketCount(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todayTicketFirst(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todayTicketFirst');
    try {
      return super.todayTicketFirst(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todayTicketLast(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todayTicketLast');
    try {
      return super.todayTicketLast(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySellCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellCash');
    try {
      return super.todaySellCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySellCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellCoverCash');
    try {
      return super.todaySellCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySellDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellDeferred');
    try {
      return super.todaySellDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySpendDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendDeferred');
    try {
      return super.todaySpendDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySellYup(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellYup');
    try {
      return super.todaySellYup(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySpendCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendCash');
    try {
      return super.todaySpendCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySpendCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendCoverCash');
    try {
      return super.todaySpendCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int todaySpendYup(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendYup');
    try {
      return super.todaySpendYup(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthTicketCount(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthTicketCount');
    try {
      return super.monthTicketCount(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthTicketFirst(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthTicketFirst');
    try {
      return super.monthTicketFirst(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthTicketLast(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthTicketLast');
    try {
      return super.monthTicketLast(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSellCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellCash');
    try {
      return super.monthSellCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSellCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellCoverCash');
    try {
      return super.monthSellCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSellYup(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellYup');
    try {
      return super.monthSellYup(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSellDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellDeferred');
    try {
      return super.monthSellDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSpendCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendCash');
    try {
      return super.monthSpendCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSpendCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendCoverCash');
    try {
      return super.monthSpendCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSpendYup(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendYup');
    try {
      return super.monthSpendYup(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int monthSpendDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendDeferred');
    try {
      return super.monthSpendDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tickets: ${tickets},
initialLoading: ${initialLoading},
now: ${now}
    ''';
  }
}
