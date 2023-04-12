// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:models_weebi/abstractions.dart';
import 'package:models_weebi/common.dart' show PaiementType, TicketType;
import 'package:models_weebi/utils.dart' show WeebiDates;

// Project imports:
import 'package:models_weebi/weebi_models.dart' show Herder, TicketWeebi;

import 'package:models_weebi/extensions.dart';

import 'package:services_weebi/services_weebi.dart';

part 'tickets.g.dart';

class TicketsStore = TicketsStoreBase with _$TicketsStore;

abstract class TicketsStoreBase<T extends TicketsServiceAbstract>
    extends AbstractStore with Store {
  final T _ticketsService;

  @observable
  ObservableSet<TicketWeebi> tickets = ObservableSet<TicketWeebi>();

  @observable // really needed ?
  ObservableList<TicketsGroupedByTimeFrame> listOfTicketsByTimeFrame =
      ObservableList<TicketsGroupedByTimeFrame>();

  @observable
  bool initialLoading = true;

  @observable
  DateTime now = DateTime.now();

  @observable
  Observable<bool> isChange = Observable(false);

  @observable
  Observable<DateTimeRange> range = Observable(
    DateTimeRange(
      start: WeebiDates.defaultFirstDate,
      end: WeebiDates.defaultLastDate,
    ),
  );

  TicketsStoreBase(this._ticketsService) {
    initialLoading = true;
    tickets = ObservableSet<TicketWeebi>();
    isChange = Observable(false);
    listOfTicketsByTimeFrame = ObservableList<TicketsGroupedByTimeFrame>();
    range = Observable(
      DateTimeRange(
        start: WeebiDates.defaultFirstDate,
        end: WeebiDates.defaultLastDate,
      ),
    );
    // * reuse for filtering past 30 days
    // range = Observable(DateTimeRange(
    //     start: DateTime.now().subtract(const Duration(days: 30)),
    //     end: DateTime.now().add(const Duration(hours: 1))));
  }

  @action // spark a setState in the view
  void setChange() => isChange = Observable(!isChange.value);

  @computed
  ObservableList<TicketWeebi> get selected => ObservableList.of(
        tickets
            .where((e) =>
                e.date.isAfter(range.value.start) ||
                e.date.isAtSameMomentAs(range.value.start))
            .where((e) =>
                e.date.isBefore(range.value.end) ||
                e.date.isAtSameMomentAs(range.value.end))
            .sorted((a, b) => a.date.compareTo(b.date)),
      );

  @computed
  ObservableList<TicketWeebi> get selectedNoStock => ObservableList.of(
        selected
            .where((e) => e.ticketType != TicketType.stockIn)
            .where((e) => e.ticketType != TicketType.stockOut)
            .sorted((a, b) => a.date.compareTo(b.date)),
      );

  @computed
  ObservableList<TicketsGroupedByTimeFrame> get selectedByTimeFrame {
    switch (timeFrame) {
      case TimeFrame.day:
        return ObservableList.of(
            tickets.groupByHour(range.value.start, range.value.end));
      case TimeFrame.week:
        return ObservableList.of(
            tickets.groupByDayOfTheWeek(range.value.start, range.value.end));
      case TimeFrame.month:
        return ObservableList.of(
            tickets.groupByDayOfTheMonth(range.value.start, range.value.end));
      default:
        return ObservableList.of([]);
    }
  }

  @action
  Observable<DateTimeRange> setRange(DateTimeRange rangeParam) =>
      range = Observable(rangeParam);

  @computed
  TimeFrame get timeFrame => range.value.duration < const Duration(hours: 24)
      ? TimeFrame.day
      : range.value.duration < const Duration(days: 7)
          ? TimeFrame.week
          : TimeFrame.month;

  @action
  Future<void> init() async {
    final ticketsFromRpc = await _ticketsService.getAllTicketsRpc.request(null);
    tickets = ticketsFromRpc.asObservable();
    initialLoading = false;
  }

  @action
  Future<Set<TicketWeebi>> addAllTickets(Set<TicketWeebi> daTickets) async {
    await _ticketsService.addAllTicketsRpc.request(daTickets);
    tickets.addAll(daTickets);
    return tickets;
  }

  @action
  Future<ObservableSet<TicketWeebi>> importPastTickets(String json) async {
    final ticketsDecoded = (convert.json.decode(json) as List)
        .cast<Map>()
        .cast<Map<String, dynamic>>()
        .map((ticket) => TicketWeebi.fromMap(ticket))
        .toList();
    tickets = ObservableSet.of(ticketsDecoded);
    await _ticketsService.addAllTicketsRpc.request(tickets);
    return tickets;
  }

  @action
  Future<TicketWeebi> addTicket(TicketWeebi ticketData) async {
    final ticket = await _ticketsService.addTicketRpc.request(ticketData);
    tickets.add(ticket);
    return ticket;
  }

  @action
  Future<TicketWeebi> disableTicket(TicketWeebi ticketData) async {
    final disabledTicket =
        await _ticketsService.disableTicketRpc.request(ticketData);
    print('disabledTicket ${disabledTicket.status}');

    final temp = tickets.firstWhereOrNull((element) =>
        element.id == disabledTicket.id &&
        element.creationDate == disabledTicket.creationDate);
    if (temp != null) {
      tickets.remove(temp);
      tickets.add(disabledTicket);
      setChange();
      return disabledTicket;
    } else {
      throw 'disabledTicket not found';
    }
  }

  @action
  Future<TicketWeebi> restoreTicket(TicketWeebi ticketData) async {
    final restoredTicket =
        await _ticketsService.restoreTicketRpc.request(ticketData);
    final temp = tickets.firstWhereOrNull((element) =>
        element.id == restoredTicket.id &&
        element.creationDate == restoredTicket.creationDate);
    if (temp != null) {
      tickets.remove(temp);
      tickets.add(restoredTicket);
      setChange();
      return restoredTicket;
    } else {
      throw 'restoredTicket not found';
    }
  }

  @action
  Future<ObservableSet<TicketWeebi>> deleteTicket(
      TicketWeebi ticketData) async {
    if (tickets.any((t) =>
        t.creationDate.isAtSameMomentAs(ticketData.creationDate) &&
        t.id == ticketData.id)) {
      await _ticketsService.deleteTicketRpc.request(ticketData);
      tickets.remove(ticketData);
    }
    setChange();
    return tickets;
  }

  @action
  Future<void> deleteAllTickets() async {
    await _ticketsService.deleteAllTicketsRpc.request({});
    tickets = ObservableSet.of([]);
  }

  @action
  ObservableSet<TicketWeebi> searchTicketById(String queryString) => tickets
      .where((t) => t.id.toString() == queryString)
      .toSet()
      .asObservable();

  @action
  int todayTicketCount(DateTime date) => tickets
      .where((t) =>
          t.date.year == date.year &&
          t.date.month == date.month &&
          t.date.day == date.day)
      .length;

  @action
  Observable<double> lineQuantityInDash(int productId, DateTimeRange range) {
    final double stockCount = tickets
        .where((t) => t.status)
        .where((t) => t.date.isAfter(range.start))
        .where((t) => t.date.isBefore(range.end))
        .where((t) =>
            t.ticketType == TicketType.spend ||
            t.ticketType == TicketType.spendDeferred ||
            t.ticketType == TicketType.stockIn)
        .fold(
            0.0,
            (val, t) =>
                val +
                t.items.where((i) => i.article.productId == productId).fold(
                    0.0, (val, i) => val + (i.quantity * i.article.weight)));
    return Observable(stockCount);
  }

  @action
  Observable<double> lineQuantityOutDash(int productId, DateTimeRange range) {
    final double stockCount = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.isAfter(range.start))
        .where((t) => t.date.isBefore(range.end))
        .where((t) =>
            t.ticketType == TicketType.sell ||
            t.ticketType == TicketType.sellDeferred ||
            t.ticketType == TicketType.stockOut)
        .fold(
          0.0,
          (val, t) =>
              val +
              t.items
                  .where((i) => i.article.productId == productId)
                  .fold(0.0, (val, i) => val + (i.quantity * i.article.weight)),
        );
    return Observable(stockCount);
  }

  @action
  int todayTicketFirst(DateTime date) =>
      tickets
          .firstWhereOrNull((t) =>
              t.date.year == date.year &&
              t.date.month == date.month &&
              t.date.day == date.day)
          ?.id ??
      0;

  @action
  int todayTicketLast(DateTime date) =>
      tickets
          .lastWhereOrNull(
            (t) =>
                t.date.year == date.year &&
                t.date.month == date.month &&
                t.date.day == date.day,
          )
          ?.id ??
      0;

  @action
  int todaySellCash(DateTime date) {
    var sellCash = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.ticketType == TicketType.sell)
        .where((t) => t.paiementType == PaiementType.cash)
        .fold(
            0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

    return sellCash;
  }

  @action
  int todaySellCoverCash(DateTime date) {
    var sellCover = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.paiementType == PaiementType.cash)
        .where((t) => t.ticketType == TicketType.sellCovered)
        .fold(0, (prev, element) => prev + element.received);

    return sellCover;
  }

  @action
  int todaySellDeferred(DateTime date) {
    var sellDeferredToday = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.sellDeferred)
        .fold(
            0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

    return sellDeferredToday.round();
  }

  @action
  int todaySpendDeferred(DateTime date) {
    var spendDeferredToday = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.spendDeferred)
        .fold(
            0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

    return spendDeferredToday.round();
  }

  @action
  int todaySellMMoney(DateTime date) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.year == date.year)
      .where((t) => t.date.month == date.month)
      .where((t) => t.date.day == date.day)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .where((t) => t.ticketType == TicketType.sell)
      .fold(0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

  @action
  int todaySpendCash(DateTime date) {
    var spendCash = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.ticketType == TicketType.spend)
        .where((t) => t.paiementType == PaiementType.cash)
        .fold(
            0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

    return spendCash;
  }

  @action
  int todaySpendCoverCash(DateTime date) {
    var spendCoverCash = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.ticketType == TicketType.spendCovered)
        .where((t) => t.paiementType == PaiementType.cash)
        .fold(0, (prev, element) => prev + element.received);

    return spendCoverCash;
  }

  @action
  int todaySpendMMoney(DateTime date) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.year == date.year)
      .where((t) => t.date.month == date.month)
      .where((t) => t.date.day == date.day)
      .where((t) => t.ticketType == TicketType.spend)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .fold(0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

  @action
  int monthTicketCount(DateTime date) => tickets
      .where((t) => t.date.year == date.year && t.date.month == date.month)
      .length;

  @action
  int monthTicketFirst(DateTime date) =>
      tickets
          .firstWhereOrNull(
              (t) => t.date.year == date.year && t.date.month == date.month)
          ?.id ??
      0;

  @action
  int monthTicketLast(DateTime date) =>
      tickets
          .lastWhereOrNull(
              (t) => t.date.year == date.year && t.date.month == date.month)
          ?.id ??
      0;

  @action
  int monthSellCash(DateTime date) {
    var sellCash = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.ticketType == TicketType.sell)
        .where((t) => t.paiementType == PaiementType.cash)
        .fold(
            0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

    return sellCash;
  }

  @action
  int monthSellCoverCash(DateTime date) {
    var sellCover = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.paiementType == PaiementType.cash)
        .where((t) => t.ticketType == TicketType.sellCovered)
        .fold(0, (prev, element) => prev + element.received);

    return sellCover;
  }

  @action
  int monthSellMMoney(DateTime date) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.year == date.year)
      .where((t) => t.date.month == date.month)
      .where((t) => t.ticketType == TicketType.sell)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .fold(0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

  @action
  int monthSellDeferred(DateTime date) {
    var sellDeferredMonth = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.sellDeferred)
        .fold(
            0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

    return sellDeferredMonth.round();
  }

  @action
  int monthSpendCash(DateTime date) {
    var spendCash = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.ticketType == TicketType.spend)
        .where((t) => t.paiementType == PaiementType.cash)
        .fold(
            0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);
    return spendCash;
  }

  @action
  int monthSpendCoverCash(DateTime date) {
    var spendCover = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.paiementType == PaiementType.cash)
        .where((t) => t.ticketType == TicketType.spendCovered)
        .fold(0, (prev, element) => prev + element.received);

    return spendCover;
  }

  @action
  int monthSpendMMoney(DateTime date) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.year == date.year)
      .where((t) => t.date.month == date.month)
      .where((t) => t.ticketType == TicketType.spend)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .fold(0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

  @action
  int monthSpendDeferred(DateTime date) {
    var spendDeferredMonth = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.spendDeferred)
        .fold(
            0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

    return spendDeferredMonth.round();
  }

// TODO use the range within the store instead of this
  @action
  int rangeTicketCount(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .length;

  @action
  int rangeTicketFirst(DateTime firstDate, DateTime lastDate) =>
      tickets
          .firstWhereOrNull(
              (t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
          ?.id ??
      0;

  @action
  int rangeTicketLast(DateTime firstDate, DateTime lastDate) =>
      tickets
          .lastWhereOrNull(
              (t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
          ?.id ??
      0;

  @action
  int rangeSellCash(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.ticketType == TicketType.sell)
      .where((t) => t.paiementType == PaiementType.cash)
      .fold(0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

  @action
  int rangeSellCoverCash(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.paiementType == PaiementType.cash)
      .where((t) => t.ticketType == TicketType.sellCovered)
      .fold(0, (prev, element) => prev + element.received);

  @action
  int rangeSellMMoney(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.ticketType == TicketType.sell)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .fold(0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

  @action
  int rangeSellDeferred(DateTime firstDate, DateTime lastDate) {
    var rangeSellDeferred = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.sellDeferred)
        .fold(
            0, (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

    return rangeSellDeferred.round();
  }

  @action
  int rangeSpendCash(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.paiementType == PaiementType.cash)
      .where((t) => t.ticketType == TicketType.spend)
      .fold(0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

  @action
  int rangeSpendCoverCash(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.paiementType == PaiementType.cash)
      .where((t) => t.ticketType == TicketType.spendCovered)
      .fold(0, (prev, element) => prev + element.received);

  @action
  int rangeSpendYup(DateTime firstDate, DateTime lastDate) => tickets
      .where((t) => t.status == true)
      .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
      .where((t) => t.ticketType == TicketType.spend)
      .where((t) => t.paiementType == PaiementType.mobileMoney)
      .fold(0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

  @action
  int rangeSpendDeferred(DateTime firstDate, DateTime lastDate) {
    var rangespendDeferred = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
        .where((t) => t.paiementType == PaiementType.nope)
        .where((t) => t.ticketType == TicketType.spendDeferred)
        .fold(
            0, (prev, element) => prev + element.totalCostTaxAndPromoIncluded);

    return rangespendDeferred.round();
  }

//
  @action
  int supplierCredit(int herderId, DateTime date) => tickets.isEmpty
      ? 0
      : tickets
          .where((t) => t.contactInfo == herderId.toString())
          .where((t) => t.status == true)
          .where((t) => t.date.isBefore(date))
          .where((t) =>
              t.ticketType == TicketType.spendCovered ||
              t.ticketType == TicketType.wage)
          .fold(0, (prev, e) => prev + e.received);

  @action
  double supplierDebit(int herderId, DateTime date) => tickets.isEmpty
      ? 0
      : tickets
          .where((t) => t.contactInfo == herderId.toString())
          .where((t) => t.status == true)
          .where((t) => t.date.isBefore(date))
          .where((t) => t.ticketType == TicketType.spendDeferred)
          .fold(0, (prev, e) => prev + e.totalCostTaxAndPromoIncluded);

  @action
  int clientCredit(int herderId, DateTime date) => tickets.isEmpty
      ? 0
      : tickets
          .where((t) => t.contactInfo == herderId.toString())
          .where((t) => t.status == true)
          .where((t) => t.date.isBefore(date))
          .where((t) => t.ticketType == TicketType.sellCovered)
          .fold(0, (prev, e) => prev + e.received);

  @action
  double clientDebit(int herderId, DateTime date) => tickets.isEmpty
      ? 0
      : tickets
          .where((t) => t.contactInfo == herderId.toString())
          .where((t) => t.status == true)
          .where((t) => t.date.isBefore(date))
          .where((t) => t.ticketType == TicketType.sellDeferred)
          .fold(0, (prev, e) => prev + e.totalPriceTaxAndPromoIncluded);

  /// clients
  ///
  @action
  Map<String, Herder> monthTopClientsSellCashOnly(
      DateTime date, List<Herder> herdersList) {
    final map = <String, Herder>{};
    for (var herder in herdersList) {
      var soldPerClient = tickets
          .where((t) => t.status == true)
          .where((t) => t.date.year == date.year)
          .where((t) => t.date.month == date.month)
          .where((t) => t.ticketType == TicketType.sell)
          .where((t) => t.paiementType == PaiementType.cash)
          .where((t) => t.contactInfo == herder.id.toString())
          .fold(0,
              (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

      map[soldPerClient.toString()] = herder;
    }
    return map;
  }

  @action
  Map<String, Herder> monthTopClientsSellAndSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final map = <String, Herder>{};
    for (final herder in herdersList) {
      final soldPerClient = tickets
          .where((t) => t.status == true)
          .where((t) => t.date.year == date.year)
          .where((t) => t.date.month == date.month)
          .where((t) =>
              t.ticketType == TicketType.sellDeferred ||
              t.ticketType == TicketType.sell)
          .where((t) => t.contactInfo == herder.id.toString())
          .fold(0,
              (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

      map[soldPerClient.toString()] = herder;
    }
    return map;
  }

  @action
  Map<String, Herder> dayAllClientsSellCashOnly(
      DateTime date, List<Herder> herdersList) {
    final map = <String, Herder>{};
    for (final herder in herdersList) {
      final soldPerClient = tickets
          .where((t) => t.status == true)
          .where((t) =>
              t.date.year == date.year &&
              t.date.month == date.month &&
              t.date.day == date.day)
          .where((t) => t.ticketType == TicketType.sell)
          .where((t) => t.paiementType == PaiementType.cash)
          .where((t) => t.contactInfo == herder.id.toString())
          .fold(0,
              (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

      map[soldPerClient.toString()] = herder;
    }
    return map;
  }

  @action
  Map<String, Herder> dayAllClientsSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final map = <String, Herder>{};
    for (final herder in herdersList) {
      final soldPerClient = tickets
          .where((t) => t.status == true)
          .where((t) =>
              t.date.year == date.year &&
              t.date.month == date.month &&
              t.date.day == date.day)
          .where((t) => t.ticketType == TicketType.sellDeferred)
          .where((t) => t.contactInfo == herder.id.toString())
          .fold(0,
              (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

      map[soldPerClient.toString()] = herder;
    }
    return map;
  }

  @action
  Map<String, Herder> dayAllClientsSellAndSellDeferred(
      DateTime date, List<Herder> herdersList) {
    final map = <String, Herder>{};
    for (final herder in herdersList) {
      final soldPerClient = tickets
          .where((t) => t.status == true)
          .where((t) =>
              t.date.year == date.year &&
              t.date.month == date.month &&
              t.date.day == date.day)
          .where((t) =>
              t.ticketType == TicketType.sell &&
              t.ticketType == TicketType.sellDeferred)
          .where((t) => t.contactInfo == herder.id.toString())
          .fold(0,
              (prev, element) => prev + element.totalPriceTaxAndPromoIncluded);

      map[soldPerClient.toString()] = herder;
    }
    return map;
  }

// wages in the making
  @action
  int todayWages(DateTime date) {
    int wages = tickets
        .where((t) => t.status == true)
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.date.day == date.day)
        .where((t) => t.ticketType == TicketType.wage)
        .fold(0, (prev, element) => prev + element.received);

    return wages;
  }

  @action
  int monthWages(DateTime date) {
    int wages = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.year == date.year && t.date.month == date.month)
        .where((t) => t.ticketType == TicketType.wage)
        .fold(0, (prev, element) => prev + element.received);

    return wages;
  }

  @action
  int rangeWage(DateTime firstDate, DateTime lastDate) {
    int wages = tickets
        .where((t) => t.status == true)
        .where((t) => t.date.isAfter(firstDate) && t.date.isBefore(lastDate))
        .where((t) => t.ticketType == TicketType.wage)
        .fold(0, (prev, element) => prev + element.received);

    return wages;
  }
}
