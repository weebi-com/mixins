import 'package:collection/collection.dart';
import 'package:flutter/src/material/time.dart';

import 'package:mixins_weebi/mobx_store_ticket.dart';
import 'package:mixins_weebi/src/mobx_stores/filters/timespan.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';

part 'tickets_filter.g.dart';

// ! using below would trigger mobx error MobXCaughtException: MobXCaughtException: Computed values are not
// allowed to cause side effects by changing observables that are already being observed
// extension IntSetHelper on Set<int> {
//   void removeIdIfUnfound(int id) {
//     if (isNotEmpty && contains(id) == false) {
//       remove(id);
//     }
//     return;
//   }
// }

// note that iterating over and over tickets will lead eventually to performance issue
// but only when tickets reach more than 100 000
// so doubt shops will reach it before 2030
// by then we will have rolled out closings which allow archiving tickets
// so no need to rework perf here, better focus elsewhere
// if really needed, e.g. for a specific use case,
// another version of this store iterating only once over ticket could be dug

class TicketsFilterStore = _TicketsFilterStore with _$TicketsFilterStore;

abstract class _TicketsFilterStore with Store {
  final TicketsStore _ticketsStore;
  final Set<Herder> herders;

  _TicketsFilterStore(this._ticketsStore, this.herders) {}

  @observable
  DateRangeW dateRange = DateRangeW.defaultDateRange;

  @observable
  ObservableSet<PaiementType> paiementTypes =
      ObservableSet.of(PaiementType.allPaiementTypes);

  @observable
  ObservableSet<TicketType> ticketTypes =
      ObservableSet.of(TicketType.allTicketTypes);

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

  @observable
  String articleName = '';

  List<ReactionDisposer> _disposers = [];

  void setupFilters() {
    _disposers = [
      reaction((_) => ticketsIdFromTextField, filterById),
      reaction((_) => contactNameOrTel, filterByContact),
      reaction((_) => articleName, filterByArticleName),
      reaction((_) => dateRange, filterByDateRange),
      reaction((_) => ticketTypesComputed, filterByTicketTypes),
      reaction((_) => paiementTypesComputed, filterByPaiementTypes),
      reaction((_) => ticketsStatus, filterByTicketStatus),
    ];
  }

  // the 2 computed below look useless but they are needed to spark the reaction above
  // * do not remove
  @computed
  ObservableSet<TicketType> get ticketTypesComputed =>
      ObservableSet.of(ticketTypes);
  @computed
  ObservableSet<PaiementType> get paiementTypesComputed =>
      ObservableSet.of(paiementTypes);

  @computed
  ObservableSet<int> get filteredIds {
    ObservableSet<int> filteredIds = ObservableSet<int>();
    filteredIds.clear();
    final ticketTypesEquals = const DeepCollectionEquality().equals;
    final paiementTypesEquals = const DeepCollectionEquality().equals;
    if (ticketsIdFromTextField.isEmpty &&
        contactNameOrTel.isEmpty &&
        articleName.isEmpty &&
        dateRange == DateRangeW.defaultDateRange &&
        ticketsStatus == Tristate.unknown &&
        ticketTypesEquals(
            ticketTypesComputed, ObservableSet.of(TicketType.allTicketTypes)) &&
        paiementTypesEquals(paiementTypesComputed,
            ObservableSet.of(PaiementType.allPaiementTypes))) {
      // no filters setup yet so all tickets are displayed
      for (final ticket in _ticketsStore.tickets) {
        filteredIds.add(ticket.id);
      }
    } else {
      if (idsFromTicketIdTextField.isEmpty &&
          idsContact.isEmpty &&
          idsArticle.isEmpty &&
          idsDateRange.isEmpty &&
          idsTicketTypes.isEmpty &&
          idsPaiementTypes.isEmpty &&
          idsStatus.isEmpty) {
        // at least 1 filter, but not match, display empty list
      } else {
        // at least 1 filter and 1 match, check filters accordingly to add a ticket
        // since filters overlap we check if ticketId is also included in the filters setup
        // else we remove it
        // DO NOT refactorize this sherlock as this would trigger mobx error, cf line 15
        if (idsFromTicketIdTextField.isNotEmpty) {
          for (final id in idsFromTicketIdTextField) {
            filteredIds.add(id);
            if (idsContact.isNotEmpty && idsContact.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsDateRange.isNotEmpty && idsDateRange.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
        if (idsArticle.isNotEmpty) {
          for (final id in idsArticle) {
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
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
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
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
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
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
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
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
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
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsStatus.isNotEmpty && idsStatus.contains(id) == false) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
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
            if (ticketTypesComputed.isEmpty ||
                (idsTicketTypes.isNotEmpty &&
                    idsTicketTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (paiementTypes.isEmpty ||
                (idsPaiementTypes.isNotEmpty &&
                    idsPaiementTypes.contains(id) == false)) {
              filteredIds.remove(id);
            }
            if (idsArticle.isNotEmpty && idsArticle.contains(id) == false) {
              filteredIds.remove(id);
            }
          }
        }
      }
    }
    return filteredIds;
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
      ObservableSet<TicketType> ticketTypesDashFromReaction) {
    idsTicketTypes.clear();
    for (final ticket in _ticketsStore.tickets) {
      for (final ticketType in ticketTypesDashFromReaction) {
        if (ticket.ticketType == ticketType) {
          idsTicketTypes.add(ticket.id);
        }
      }
    }
    return;
  }

  @action
  void filterByPaiementTypes(
      ObservableSet<PaiementType> paiementTypesDashFromReaction) {
    idsPaiementTypes.clear();
    for (final ticket in _ticketsStore.tickets) {
      for (final paiementType in paiementTypesDashFromReaction) {
        if (ticket.paiementType == paiementType) {
          idsPaiementTypes.add(ticket.id);
        }
      }
    }
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
    return;
  }

  @action
  void filterByArticleName(String queryString) {
    idsArticle.clear();
    final tempIds =
        _ticketsStore.tickets.findTicketsWithArticleName(queryString);
    for (final id in tempIds) {
      idsArticle.add(id);
    }
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
  ObservableSet<int> idsArticle = ObservableSet<int>();

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

  @action
  TicketType switchTicketType(TicketType data, bool _status) {
    if (_status) {
      ticketTypes.add(data);
    } else {
      ticketTypes.removeWhere((e) => e == data);
    }
    return data;
  }

  @action
  ObservableSet<TicketType> switchAllTicketTypes(bool _status) {
    if (_status) {
      ticketTypes.clear();
      ticketTypes.addAll(TicketType.allTicketTypes);
    } else {
      ticketTypes.clear();
    }
    return ticketTypes;
  }

  ///----------------------------------------
  /// PaiementTypes
  ///----------------------------------------

  @action
  PaiementType switchPaiementTypes(PaiementType data, bool _status) {
    if (_status) {
      paiementTypes.add(data);
    } else {
      paiementTypes.removeWhere((e) => e == data);
    }
    return data;
  }

  @action
  ObservableSet<PaiementType> switchAllPaiementTypes(bool _status) {
    if (_status) {
      paiementTypes.clear();
      paiementTypes.addAll(PaiementType.allPaiementTypes);
    } else {
      paiementTypes.clear();
    }
    return paiementTypes;
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}
