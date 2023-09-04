import 'package:collection/collection.dart';
import 'package:flutter/src/material/time.dart';

import 'package:mixins_weebi/mobx_store_ticket.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/paiement_type_dash.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/ticket_type_dash.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/timespan.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';

part 'tickets_filter.g.dart';

class TicketsFilterStore = _TicketsFilterStore with _$TicketsFilterStore;

abstract class _TicketsFilterStore with Store {
  final TicketsStore _ticketsStore;
  final Set<Herder> herders;
  _TicketsFilterStore(this._ticketsStore, this.herders) {
    ticketTypesDash = ObservableSet.of(TicketTypeDash.setTicketTypesDash);
    paiementTypesDash = ObservableSet.of(PaiementTypeDash.setPaiementTypesDash);
  }

  @observable
  DateRangeW dateRange = DateRangeW.defaultDateRange;

  @observable
  ObservableSet<PaiementTypeDash> paiementTypesDash = ObservableSet();

  @observable
  ObservableSet<TicketTypeDash> ticketTypesDash = ObservableSet();

  // using a tristate is a slight hack to avoid filtering tickets when user want to see both
  // Tristate.unknown means no status filtered
  // Tristate.no means status == false only
  // Tristate.yes means status == true only

  @observable
  Tristate ticketsStatus = Tristate.unknown;

  @observable
  String ticketsIdFromTextField = '';

  @observable
  String contactNameOrTel = '';

  // loading while filtering

  @observable
  ObservableFuture<bool> isfilteringCompleted = ObservableFuture.value(true);

  @computed
  bool get isSearchPending =>
      isfilteringCompleted.status == FutureStatus.pending;

  List<ReactionDisposer> _disposers = [];

  void setupFilters() {
    _disposers = [
      reaction((_) => ticketsIdFromTextField, filterById),
      reaction((_) => contactNameOrTel, filterByContact),
      reaction((_) => dateRange, filterByDateRange),
      reaction((_) => selectedTicketTypeDash, filterByTicketTypes),
      reaction((_) => selectedPaiementTypeDash, filterByPaiementTypes),
      reaction((_) => ticketsStatus, filterByTicketStatus),
    ];
  }

  @computed
  ObservableSet<TicketTypeDash> get selectedTicketTypeDash =>
      ObservableSet.of(ticketTypesDash.where((e) => e.status).toList());

  @computed
  ObservableSet<PaiementTypeDash> get selectedPaiementTypeDash =>
      ObservableSet.of(paiementTypesDash.where((e) => e.status).toList());

  @computed
  ObservableSet<int> get filteredIds {
    ObservableSet<int> filteredIds = ObservableSet<int>();
    filteredIds.clear();
    final ticketTypesEquals = const DeepCollectionEquality().equals;
    final paiementTypesEquals = const DeepCollectionEquality().equals;
    if (ticketsIdFromTextField.isEmpty &&
        contactNameOrTel.isEmpty &&
        dateRange == DateRangeW.defaultDateRange &&
        ticketsStatus == Tristate.unknown &&
        ticketTypesEquals(selectedTicketTypeDash,
            ObservableSet.of(TicketTypeDash.setTicketTypesDash)) &&
        paiementTypesEquals(selectedPaiementTypeDash,
            ObservableSet.of(PaiementTypeDash.setPaiementTypesDash))) {
      // nothing done yet
      for (final ticket in _ticketsStore.tickets) {
        filteredIds.add(ticket.id);
      }
      return filteredIds;
    } else {
      if (idsFromTicketIdTextField.isEmpty &&
          idsContact.isEmpty &&
          idsDateRange.isEmpty &&
          idsTicketTypes.isEmpty &&
          idsPaiementTypes.isEmpty &&
          idsStatus.isEmpty) {
        return filteredIds;
      } else {
        isfilteringCompleted = ObservableFuture.value(false);
        if (idsFromTicketIdTextField.isNotEmpty) {
          for (final id in idsFromTicketIdTextField) {
            filteredIds.add(id);
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsTicketTypes.isNotEmpty &&
                idsTicketTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsPaiementTypes.isNotEmpty &&
                idsPaiementTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsContact.isNotEmpty) {
          for (final id in idsContact) {
            filteredIds.add(id);
            if (idsFromTicketIdTextField.isNotEmpty &&
                idsFromTicketIdTextField.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsTicketTypes.isNotEmpty &&
                idsTicketTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsPaiementTypes.isNotEmpty &&
                idsPaiementTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsDateRange.isNotEmpty) {
          for (final id in idsDateRange) {
            filteredIds.add(id);
            if (idsFromTicketIdTextField.isNotEmpty &&
                idsFromTicketIdTextField.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsTicketTypes.isNotEmpty &&
                idsTicketTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsPaiementTypes.isNotEmpty &&
                idsPaiementTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsTicketTypes.isNotEmpty) {
          for (final id in idsTicketTypes) {
            filteredIds.add(id);
            if (idsFromTicketIdTextField.isNotEmpty &&
                idsFromTicketIdTextField.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsPaiementTypes.isNotEmpty &&
                idsPaiementTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsPaiementTypes.isNotEmpty) {
          for (final id in idsPaiementTypes) {
            filteredIds.add(id);
            if (idsFromTicketIdTextField.isNotEmpty &&
                idsFromTicketIdTextField.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsTicketTypes.isNotEmpty &&
                idsTicketTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsStatus.isNotEmpty) {
          for (final id in idsStatus) {
            filteredIds.add(id);
            if (idsFromTicketIdTextField.isNotEmpty &&
                idsFromTicketIdTextField.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsTicketTypes.isNotEmpty &&
                idsTicketTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsPaiementTypes.isNotEmpty &&
                idsPaiementTypes.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }

        isfilteringCompleted = ObservableFuture.value(true);
        return filteredIds;
      }
    }
  }

  @computed
  ObservableSet<TicketWeebi> get filteredTickets {
    return ObservableSet.of(_ticketsStore.tickets
        .idsToTickets(filteredIds)
        .sorted((a, b) => b.id.compareTo(a.id)));
  }

  @action
  Tristate switchStatus(Tristate _state) => ticketsStatus = _state;

  @action
  void filterByDateRange(DateRangeW dateRange) {
    idsDateRange.clear();
    final temp = _ticketsStore.tickets
        .where((e) =>
            e.date.isAfter(dateRange.start) ||
            e.date.isAtSameMomentAs(dateRange.start))
        .where((e) =>
            e.date.isBefore(dateRange.end) ||
            e.date.isAtSameMomentAs(dateRange.end));
    for (final t in temp) {
      idsDateRange.add(t.id);
    }

    return;
  }

  @action
  void filterByTicketTypes(
      ObservableSet<TicketTypeDash> ticketTypesDashFromReaction) {
    idsTicketTypes.clear();
    for (final ticket in _ticketsStore.tickets) {
      for (final ticketTypeDash
          in ticketTypesDashFromReaction.where((ttd) => ttd.status == true)) {
        if (ticket.ticketType == ticketTypeDash.ticketType) {
          idsTicketTypes.add(ticket.id);
        }
      }
    }

    return;
  }

  @action
  void filterByPaiementTypes(
      ObservableSet<PaiementTypeDash> paiementTypesDashFromReaction) {
    idsPaiementTypes.clear();
    for (final ticket in _ticketsStore.tickets) {
      for (final paiementTypeDash
          in paiementTypesDashFromReaction.where((ptd) => ptd.status == true)) {
        if (ticket.paiementType == paiementTypeDash.paiementType) {
          idsPaiementTypes.add(ticket.id);
        }
      }
    }
    print('idsPaiementTypes');
    print(idsPaiementTypes.length);
    return;
  }

  @action
  void filterByTicketStatus(Tristate ticketsStatusFromReaction) {
    idsStatus.clear();
    if (ticketsStatusFromReaction == Tristate.unknown) {
      return;
    }
    final status = ticketsStatusFromReaction == Tristate.yes;
    for (final ticket in _ticketsStore.tickets) {
      if (ticket.status == status) {
        idsStatus.add(ticket.id);
      }
    }
    return;
  }

  @action
  void filterByContact(String queryString) {
    idsContact.clear();
    final tempIds = _ticketsStore.tickets
        .findTicketsWithHerderNameOrTel(queryString, herders);
    for (final id in tempIds) {
      idsContact.add(id);
    }
    print(idsContact.length);
    return;
  }

  @action
  void filterById(String queryString) {
    idsFromTicketIdTextField.clear();
    final tempIds = _ticketsStore.tickets.findTicketsById(queryString);
    for (final id in tempIds) {
      idsFromTicketIdTextField.add(id);
    }
    return;
  }

  @observable
  ObservableSet<int> idsDateRange = ObservableSet<int>();

  @observable
  ObservableSet<int> idsContact = ObservableSet<int>();

  @observable
  ObservableSet<int> idsFromTicketIdTextField = ObservableSet<int>();

  @observable
  ObservableSet<int> idsTicketTypes = ObservableSet<int>();

  @observable
  ObservableSet<int> idsPaiementTypes = ObservableSet<int>();

  @observable
  ObservableSet<int> idsStatus = ObservableSet<int>();

  //--------------DATE-TIME TOUT CA//----------------------------------------
  @observable
  Timespan timespan = Timespan.day;

  @observable
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0),
      endTime = TimeOfDay(hour: 23, minute: 59);

  // @observable
  // DateTime startDate = WeebiDates.defaultFirstDate;
  // @observable
  // DateTime endDate = WeebiDates.defaultLastDate;
  @action
  void setTimespan(Timespan t) {
    switch (t) {
      case Timespan.day:
        final n = DateTime.now();
        dateRange = DateRangeW(
            start: DateTime(
                n.year,
                n.month,
                n.day,
                WeebiDates.defaultFirstDate.hour,
                WeebiDates.defaultFirstDate.minute,
                WeebiDates.defaultFirstDate.second,
                WeebiDates.defaultFirstDate.millisecond,
                WeebiDates.defaultFirstDate.microsecond),
            end: (DateTime(
                n.year,
                n.month,
                n.day,
                WeebiDates.defaultLastDate.hour,
                WeebiDates.defaultLastDate.minute,
                WeebiDates.defaultLastDate.second,
                WeebiDates.defaultLastDate.millisecond,
                WeebiDates.defaultLastDate.microsecond)));
        timespan = Timespan.day;
        break;
      case Timespan.month:
        dateRange = DateRangeW(
            start: DateTime(0).nowMonthFirstDay(),
            end: DateTime(0).nowMonthLastDay());
        timespan = Timespan.month;
        break;
      case Timespan.range:
        dateRange = DateRangeW(start: dateRange.start, end: dateRange.end);
        timespan = Timespan.range;
        break;
      case Timespan.full:
        dateRange = DateRangeW(
            start: WeebiDates.defaultFirstDate,
            end: WeebiDates.defaultLastDate);
        timespan = Timespan.full;
        break;

      default:
    }
  }

  @action
  setStartTime(TimeOfDay _time) {
    startTime = _time;
    final newStart = DateTime(dateRange.start.year, dateRange.start.month,
        dateRange.start.day, startTime.hour, startTime.minute);
    dateRange = DateRangeW(start: newStart, end: dateRange.end);
  }

  @action
  setEndTime(TimeOfDay _time) {
    endTime = _time;
    final newEnd = DateTime(dateRange.end.year, dateRange.end.month,
        dateRange.end.day, endTime.hour, endTime.minute);
    dateRange = DateRangeW(start: dateRange.start, end: newEnd);
  }

  ///----------------------------------------
  /// TicketTypes
  ///----------------------------------------
  @computed
  bool? get areTicketTypesSelected {
    final isAnyTrue = ticketTypesDash.any((e) => e.status);
    final isAnyFalse = ticketTypesDash.any((e) => !e.status);
    return (isAnyTrue && !isAnyFalse)
        ? true
        : (!isAnyTrue && isAnyFalse)
            ? false
            : null;
  }

  @action
  TicketTypeDash switchTicketType(TicketTypeDash data, bool _status) {
    ticketTypesDash.removeWhere((e) => e.ticketType == data.ticketType);
    data.status = _status;
    ticketTypesDash.add(data);
    return data;
  }

  @action
  ObservableSet<TicketTypeDash> switchAllTicketTypes(bool _status) {
    ticketTypesDash.clear();
    ticketTypesDash.addAll(_status
        ? TicketTypeDash.setTicketTypesDash.toSet().asObservable()
        : TicketTypeDash.setTicketTypesDashFalse.toSet().asObservable());
    return ticketTypesDash;
  }

  ///----------------------------------------
  /// PaiementTypes
  ///----------------------------------------
  @computed
  bool? get arePaiementTypesSelected {
    final isAnyTrue = paiementTypesDash.any((e) => e.status);
    final isAnyFalse = paiementTypesDash.any((e) => !e.status);
    return (isAnyTrue && !isAnyFalse)
        ? true
        : (!isAnyTrue && isAnyFalse)
            ? false
            : null;
  }

  @action
  PaiementTypeDash switchPaiementTypes(PaiementTypeDash data, bool _status) {
    paiementTypesDash.removeWhere((e) => e.paiementType == data.paiementType);
    data.status = _status;
    paiementTypesDash.add(data);
    return data;
  }

  @action
  ObservableSet<PaiementTypeDash> switchAllPaiementTypes(bool _status) {
    paiementTypesDash.clear();
    paiementTypesDash.addAll(_status
        ? PaiementTypeDash.setPaiementTypesDash.toSet().asObservable()
        : PaiementTypeDash.setPaiementTypesDashFalse.toSet().asObservable());
    return paiementTypesDash;
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}
