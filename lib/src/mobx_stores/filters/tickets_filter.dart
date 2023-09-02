import 'package:collection/collection.dart';
import 'package:flutter/src/material/time.dart';

import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mixins_weebi/mobx_store_ticket.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/paiement_type_dash.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/ticket_type_dash.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/timespan.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';

part 'tickets_filter.g.dart';

class TicketsFilterStore = _TicketsFilterStore with _$TicketsFilterStore;

abstract class _TicketsFilterStore with Store {
  final TicketsStore _ticketsStore;
  final Set<Herder> herders;
  // final ArticleCalibre _calibre;
  _TicketsFilterStore(this._ticketsStore, this.herders) {
    ticketTypes = ObservableSet.of(TicketTypeDash.setTicketTypesDash);
    paiementTypes = ObservableSet.of(PaiementTypeDash.setPaiementTypesDash);
  }

  SearchFieldFormError errorStore = SearchFieldFormError();

  @observable
  DateRangeW dateRange = DateRangeW(
      start: WeebiDates.defaultFirstDate, end: WeebiDates.defaultLastDate);

  @observable
  ObservableSet<PaiementTypeDash> paiementTypes = ObservableSet();

  @observable
  ObservableSet<TicketTypeDash> ticketTypes = ObservableSet();

  @observable
  Observable<bool> ticketsStatus = Observable(false);

  @observable
  String ticketsId = '';

  @observable
  String contactNameOrTel = '';

  // loading while filtering
  @observable
  ObservableFuture<bool> isfilteringCompleted = ObservableFuture.value(true);

  @computed
  bool get isSearchPending =>
      isfilteringCompleted.status == FutureStatus.pending;
  // validator
  @computed
  bool get hasErrors => errorStore.hasErrors;

  List<ReactionDisposer> _disposers = [];

  void setupFilters() {
    _disposers = [
      autorun((_) => runLoader),
      reaction((_) => dateRange, filterByDateRange),
      reaction((_) => contactNameOrTel, filterByContact),
      autorun((_) {
        _ticketsStore.filteredIds.clear();
        for (final id in idsDateRange) {
          _ticketsStore.filteredIds.add(id);
        }
        for (final id in idsContact) {
          _ticketsStore.filteredIds.add(id);
        }
      }),
    ];
  }

  @action
  Observable<bool> switchStatus(bool _status) =>
      ticketsStatus = Observable(!_status);

  Future<void> runLoader() async {
    // for demo purpose only
    // TODO remove once ticket filter store finished
    print(contactNameOrTel);
    print(ticketsStatus);
    print(ticketTypes);
    print(paiementTypes);
    isfilteringCompleted = ObservableFuture.value(false);
    await Future.delayed(const Duration(seconds: 1));
    isfilteringCompleted = ObservableFuture.value(true);
    return;
  }

  void validateContactField(String text) {
    if (text.isNotEmpty) {
// TODO search by contactid, name or tel or mail
    } else {
      errorStore.contactNameOrTelError = null;
    }
    return;
  }

  @action
  void filterByDateRange(DateRangeW dateRange) {
    idsDateRange.clear();
    final temp = _ticketsStore.tickets
        .where((e) =>
            e.date.isAfter(startDate) || e.date.isAtSameMomentAs(startDate))
        .where((e) =>
            e.date.isBefore(endDate) || e.date.isAtSameMomentAs(endDate));
    for (final t in temp) {
      idsDateRange.add(t.id);
    }
    return;
  }

  @action
  void filterByContact(String queryString) {
    idsContact.clear();
    final temp = _ticketsStore.tickets
        .findTicketsWithHerderNameOrTel(queryString, herders);
    for (final t in temp) {
      idsContact.add(t);
    }
    return;
  }

  @observable
  ObservableSet<int> idsDateRange = ObservableSet<int>();
  @observable
  ObservableSet<int> idsContact = ObservableSet<int>();

  //--------------DATE-TIME TOUT CA//----------------------------------------
  @observable
  Timespan timespan = Timespan.day;

  @observable
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0),
      endTime = TimeOfDay(hour: 23, minute: 59);

  @observable
  DateTime startDate = WeebiDates.defaultFirstDate;
  @observable
  DateTime endDate = WeebiDates.defaultLastDate;
  @action
  void setTimespan(Timespan t) {
    switch (t) {
      case Timespan.day:
        final n = DateTime.now();
        setFirstDate(DateTime(
            n.year,
            n.month,
            n.day,
            WeebiDates.defaultFirstDate.hour,
            WeebiDates.defaultFirstDate.minute,
            WeebiDates.defaultFirstDate.second,
            WeebiDates.defaultFirstDate.millisecond,
            WeebiDates.defaultFirstDate.microsecond));
        setLastDate(DateTime(
            n.year,
            n.month,
            n.day,
            WeebiDates.defaultLastDate.hour,
            WeebiDates.defaultLastDate.minute,
            WeebiDates.defaultLastDate.second,
            WeebiDates.defaultLastDate.millisecond,
            WeebiDates.defaultLastDate.microsecond));
        timespan = Timespan.day;
        break;
      case Timespan.month:
        setFirstDate(DateTime(0).nowMonthFirstDay());
        setLastDate(DateTime(0).nowMonthLastDay());
        timespan = Timespan.month;
        break;
      case Timespan.range:
        setFirstDate(startDate);
        setLastDate(endDate);
        timespan = Timespan.range;
        break;
      case Timespan.full:
        setFirstDate(WeebiDates.defaultFirstDate);
        setLastDate(WeebiDates.defaultLastDate);
        timespan = Timespan.full;
        break;

      default:
    }
  }

  @action
  setFirstDate(DateTime _date) => startDate = DateTime(
      _date.year,
      _date.month,
      _date.day,
      startTime.hour,
      startTime.minute,
      WeebiDates.defaultFirstDate.second,
      WeebiDates.defaultFirstDate.millisecond,
      WeebiDates.defaultFirstDate.microsecond);
  @action
  setLastDate(DateTime _dd) => endDate = DateTime(
      _dd.year,
      _dd.month,
      _dd.day,
      endTime.hour,
      endTime.minute,
      WeebiDates.defaultLastDate.second,
      WeebiDates.defaultLastDate.millisecond,
      WeebiDates.defaultLastDate.microsecond);
  @action
  setStartTime(TimeOfDay _time) {
    startTime = _time;
    setFirstDate(startDate);
  }

  @action
  setEndTime(TimeOfDay _time) {
    endTime = _time;
    setLastDate(endDate);
  }

  ///----------------------------------------
  /// TicketTypes
  ///----------------------------------------
  @computed
  bool? get areTicketTypesSelected {
    final isAnyTrue = ticketTypes.any((e) => e.status);
    final isAnyFalse = ticketTypes.any((e) => !e.status);
    return (isAnyTrue && !isAnyFalse)
        ? true
        : (!isAnyTrue && isAnyFalse)
            ? false
            : null;
  }

  @action
  TicketTypeDash switchTicketType(TicketTypeDash data, bool _status) {
    ticketTypes.removeWhere((e) => e.ticketType == data.ticketType);
    data.status = _status;
    ticketTypes.add(data);
    return data;
  }

  @action
  ObservableSet<TicketTypeDash> switchAllTicketTypes(bool _status) {
    Set<TicketTypeDash> set = {};
    for (final t in ticketTypes) {
      t.status = _status;
      set.add(t);
    }
    ticketTypes.clear();
    ticketTypes.addAll(set);
    return ticketTypes;
  }

  ///----------------------------------------
  /// PaiementTypes
  ///----------------------------------------
  @computed
  bool? get arePaiementTypesSelected {
    final isAnyTrue = paiementTypes.any((e) => e.status);
    final isAnyFalse = paiementTypes.any((e) => !e.status);
    return (isAnyTrue && !isAnyFalse)
        ? true
        : (!isAnyTrue && isAnyFalse)
            ? false
            : null;
  }

  @action
  PaiementTypeDash switchPaiementTypes(PaiementTypeDash data, bool _status) {
    paiementTypes.removeWhere((e) => e.paiementType == data.paiementType);
    data.status = _status;
    paiementTypes.add(data);
    return data;
  }

  @action
  ObservableSet<PaiementTypeDash> switchAllPaiementTypes(bool _status) {
    Set<PaiementTypeDash> set = {};
    for (final p in paiementTypes) {
      p.status = _status;
      set.add(p);
    }
    paiementTypes.clear();
    paiementTypes.addAll(set);
    return paiementTypes;
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}

class SearchFieldFormError = _SearchFieldFormErrorCreateState
    with _$SearchFieldFormErrorCreateState;

abstract class _SearchFieldFormErrorCreateState with Store {
  @observable
  String? dateRangeError;

  @observable
  String? contactNameOrTelError;

  @computed
  bool get hasErrors => dateRangeError != null;
}
