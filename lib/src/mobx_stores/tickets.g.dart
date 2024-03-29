// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketsStore<T extends TicketsServiceAbstract>
    on TicketsStoreBase<T>, Store {
  Computed<ObservableList<TicketWeebi>>? _$selectedComputed;

  @override
  ObservableList<TicketWeebi> get selected => (_$selectedComputed ??=
          Computed<ObservableList<TicketWeebi>>(() => super.selected,
              name: 'TicketsStoreBase.selected'))
      .value;
  Computed<ObservableList<TicketWeebi>>? _$selectedNoStockComputed;

  @override
  ObservableList<TicketWeebi> get selectedNoStock =>
      (_$selectedNoStockComputed ??= Computed<ObservableList<TicketWeebi>>(
              () => super.selectedNoStock,
              name: 'TicketsStoreBase.selectedNoStock'))
          .value;
  Computed<ObservableList<TicketsGroupedByTimeFrame>>?
      _$selectedByTimeFrameComputed;

  @override
  ObservableList<TicketsGroupedByTimeFrame> get selectedByTimeFrame =>
      (_$selectedByTimeFrameComputed ??=
              Computed<ObservableList<TicketsGroupedByTimeFrame>>(
                  () => super.selectedByTimeFrame,
                  name: 'TicketsStoreBase.selectedByTimeFrame'))
          .value;
  Computed<TimeFrame>? _$timeFrameComputed;

  @override
  TimeFrame get timeFrame =>
      (_$timeFrameComputed ??= Computed<TimeFrame>(() => super.timeFrame,
              name: 'TicketsStoreBase.timeFrame'))
          .value;

  late final _$ticketsAtom =
      Atom(name: 'TicketsStoreBase.tickets', context: context);

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

  late final _$listOfTicketsByTimeFrameAtom =
      Atom(name: 'TicketsStoreBase.listOfTicketsByTimeFrame', context: context);

  @override
  ObservableList<TicketsGroupedByTimeFrame> get listOfTicketsByTimeFrame {
    _$listOfTicketsByTimeFrameAtom.reportRead();
    return super.listOfTicketsByTimeFrame;
  }

  @override
  set listOfTicketsByTimeFrame(
      ObservableList<TicketsGroupedByTimeFrame> value) {
    _$listOfTicketsByTimeFrameAtom
        .reportWrite(value, super.listOfTicketsByTimeFrame, () {
      super.listOfTicketsByTimeFrame = value;
    });
  }

  late final _$initialLoadingAtom =
      Atom(name: 'TicketsStoreBase.initialLoading', context: context);

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

  late final _$nowAtom = Atom(name: 'TicketsStoreBase.now', context: context);

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

  late final _$isChangeAtom =
      Atom(name: 'TicketsStoreBase.isChange', context: context);

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

  late final _$rangeAtom =
      Atom(name: 'TicketsStoreBase.range', context: context);

  @override
  Observable<DateRangeW> get range {
    _$rangeAtom.reportRead();
    return super.range;
  }

  @override
  set range(Observable<DateRangeW> value) {
    _$rangeAtom.reportWrite(value, super.range, () {
      super.range = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('TicketsStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addAllTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.addAllTickets', context: context);

  @override
  Future<Set<TicketWeebi>> addAllTickets(Set<TicketWeebi> daTickets) {
    return _$addAllTicketsAsyncAction.run(() => super.addAllTickets(daTickets));
  }

  late final _$importPastTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.importPastTickets', context: context);

  @override
  Future<ObservableSet<TicketWeebi>> importPastTickets(String json) {
    return _$importPastTicketsAsyncAction
        .run(() => super.importPastTickets(json));
  }

  late final _$addTicketAsyncAction =
      AsyncAction('TicketsStoreBase.addTicket', context: context);

  @override
  Future<TicketWeebi> addTicket(TicketWeebi ticketData) {
    return _$addTicketAsyncAction.run(() => super.addTicket(ticketData));
  }

  late final _$disableTicketAsyncAction =
      AsyncAction('TicketsStoreBase.disableTicket', context: context);

  @override
  Future<TicketWeebi> disableTicket(TicketWeebi ticketData) {
    return _$disableTicketAsyncAction
        .run(() => super.disableTicket(ticketData));
  }

  late final _$restoreTicketAsyncAction =
      AsyncAction('TicketsStoreBase.restoreTicket', context: context);

  @override
  Future<TicketWeebi> restoreTicket(TicketWeebi ticketData) {
    return _$restoreTicketAsyncAction
        .run(() => super.restoreTicket(ticketData));
  }

  late final _$deleteTicketAsyncAction =
      AsyncAction('TicketsStoreBase.deleteTicket', context: context);

  @override
  Future<ObservableSet<TicketWeebi>> deleteTicket(TicketWeebi ticketData) {
    return _$deleteTicketAsyncAction.run(() => super.deleteTicket(ticketData));
  }

  late final _$deleteAllTicketsAsyncAction =
      AsyncAction('TicketsStoreBase.deleteAllTickets', context: context);

  @override
  Future<bool> deleteAllTickets() {
    return _$deleteAllTicketsAsyncAction.run(() => super.deleteAllTickets());
  }

  late final _$TicketsStoreBaseActionController =
      ActionController(name: 'TicketsStoreBase', context: context);

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
  Observable<DateRangeW> setRange(DateRangeW rangeParam) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.setRange');
    try {
      return super.setRange(rangeParam);
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
  Observable<double> lineQuantityInDash(int productId, DateRangeW range) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.lineQuantityInDash');
    try {
      return super.lineQuantityInDash(productId, range);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> lineQuantityOutDash(int productId, DateRangeW range) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.lineQuantityOutDash');
    try {
      return super.lineQuantityOutDash(productId, range);
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
  num todaySellCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellCash');
    try {
      return super.todaySellCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySellCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellCoverCash');
    try {
      return super.todaySellCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySellDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellDeferred');
    try {
      return super.todaySellDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySpendDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendDeferred');
    try {
      return super.todaySpendDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySellMMoney(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySellMMoney');
    try {
      return super.todaySellMMoney(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySpendCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendCash');
    try {
      return super.todaySpendCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySpendCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendCoverCash');
    try {
      return super.todaySpendCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todaySpendMMoney(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todaySpendMMoney');
    try {
      return super.todaySpendMMoney(date);
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
  num monthSellCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellCash');
    try {
      return super.monthSellCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSellCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellCoverCash');
    try {
      return super.monthSellCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSellMMoney(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellMMoney');
    try {
      return super.monthSellMMoney(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSellDeferred(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSellDeferred');
    try {
      return super.monthSellDeferred(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSpendCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendCash');
    try {
      return super.monthSpendCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSpendCoverCash(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendCoverCash');
    try {
      return super.monthSpendCoverCash(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthSpendMMoney(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthSpendMMoney');
    try {
      return super.monthSpendMMoney(date);
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
  int rangeTicketCount(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeTicketCount');
    try {
      return super.rangeTicketCount(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int rangeTicketFirst(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeTicketFirst');
    try {
      return super.rangeTicketFirst(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int rangeTicketLast(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeTicketLast');
    try {
      return super.rangeTicketLast(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSellCash(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSellCash');
    try {
      return super.rangeSellCash(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSellCoverCash(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSellCoverCash');
    try {
      return super.rangeSellCoverCash(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSellMMoney(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSellMMoney');
    try {
      return super.rangeSellMMoney(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSellDeferred(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSellDeferred');
    try {
      return super.rangeSellDeferred(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSpendCash(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSpendCash');
    try {
      return super.rangeSpendCash(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSpendCoverCash(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSpendCoverCash');
    try {
      return super.rangeSpendCoverCash(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSpendMMoney(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSpendMMoney');
    try {
      return super.rangeSpendMMoney(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeSpendDeferred(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeSpendDeferred');
    try {
      return super.rangeSpendDeferred(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num supplierCredit(int herderId, DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.supplierCredit');
    try {
      return super.supplierCredit(herderId, date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double supplierDebit(int herderId, DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.supplierDebit');
    try {
      return super.supplierDebit(herderId, date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num clientCredit(int herderId, DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.clientCredit');
    try {
      return super.clientCredit(herderId, date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double clientDebit(int herderId, DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.clientDebit');
    try {
      return super.clientDebit(herderId, date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, Herder> monthTopClientsSellCashOnly(
      DateTime date, List<Herder> herdersList) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthTopClientsSellCashOnly');
    try {
      return super.monthTopClientsSellCashOnly(date, herdersList);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, Herder> monthTopClientsSellAndSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthTopClientsSellAndSellDeferred');
    try {
      return super.monthTopClientsSellAndSellDeferred(date, herdersList);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, Herder> dayAllClientsSellCashOnly(
      DateTime date, List<Herder> herdersList) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.dayAllClientsSellCashOnly');
    try {
      return super.dayAllClientsSellCashOnly(date, herdersList);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, Herder> dayAllClientsSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.dayAllClientsSellDeferred');
    try {
      return super.dayAllClientsSellDeferred(date, herdersList);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, Herder> dayAllClientsSellAndSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.dayAllClientsSellAndSellDeferred');
    try {
      return super.dayAllClientsSellAndSellDeferred(date, herdersList);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num todayWages(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.todayWages');
    try {
      return super.todayWages(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num monthWages(DateTime date) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.monthWages');
    try {
      return super.monthWages(date);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  num rangeWage(DateTime firstDate, DateTime lastDate) {
    final _$actionInfo = _$TicketsStoreBaseActionController.startAction(
        name: 'TicketsStoreBase.rangeWage');
    try {
      return super.rangeWage(firstDate, lastDate);
    } finally {
      _$TicketsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tickets: ${tickets},
listOfTicketsByTimeFrame: ${listOfTicketsByTimeFrame},
initialLoading: ${initialLoading},
now: ${now},
isChange: ${isChange},
range: ${range},
selected: ${selected},
selectedNoStock: ${selectedNoStock},
selectedByTimeFrame: ${selectedByTimeFrame},
timeFrame: ${timeFrame}
    ''';
  }
}
