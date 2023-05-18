import 'package:collection/collection.dart';
import 'package:mixins_weebi/src/extensions/closings/filter_by_range.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/common.dart';
import 'package:services_weebi/rpc_closings.dart';

part 'closings.g.dart';

class ClosingsStore = ClosingsStoreBase with _$ClosingsStore;

abstract class ClosingsStoreBase<S extends ClosingsServiceAbstract> with Store {
  final S closingsService;

  @observable
  bool initialLoading = true;

  @observable
  ObservableList<ClosingRange> closingRanges = ObservableList<ClosingRange>();

  @observable
  ObservableList<ClosingLedger> closingLedgers =
      ObservableList<ClosingLedger>();

  @observable
  ObservableList<ClosingLedgerShop> closingLedgerShops =
      ObservableList<ClosingLedgerShop>();

  @observable
  ObservableList<ClosingLedgerHerder> closingLedgerHerders =
      ObservableList<ClosingLedgerHerder>();

  @observable
  ObservableList<ClosingStockHerder> closingStockHerders =
      ObservableList<ClosingStockHerder>();

  @observable
  ObservableList<ClosingStock> closingStocks = ObservableList<ClosingStock>();

  @observable
  ObservableList<ClosingStockShop> closingStockShops =
      ObservableList<ClosingStockShop>();

  // * closingStockProducts are not meant to be used by their own
  // linked with stock
  @observable
  ObservableList<ClosingStockProduct> closingStockProducts =
      ObservableList<ClosingStockProduct>();

  ClosingsStoreBase(this.closingsService) {
    initialLoading = true;
    closingRanges = ObservableList<ClosingRange>();
    closingLedgers = ObservableList<ClosingLedger>();
    closingLedgerShops = ObservableList<ClosingLedgerShop>();
    closingLedgerHerders = ObservableList<ClosingLedgerHerder>();
    closingStockHerders = ObservableList<ClosingStockHerder>();
    closingStocks = ObservableList<ClosingStock>();
    closingStockShops = ObservableList<ClosingStockShop>();
    closingStockProducts = ObservableList<ClosingStockProduct>();
  }

  @action
  Future<void> init() async {
    await loadTasks();
    initialLoading = false;
    return;
  }

  @action
  Future<void> loadTasks() async {
    final cRanges = await closingsService.getClosingRangesRpc.request(null);
    closingRanges = ObservableList.of(Iterable.castFrom(cRanges));

    final cLedgers = await closingsService.getClosingLedgersRpc.request(null);
    closingLedgers = ObservableList.of(Iterable.castFrom(cLedgers));

    final cLedgerShopsTemp =
        await closingsService.getClosingLedgerShopsRpc.request(null);
    closingLedgerShops = ObservableList.of(Iterable.castFrom(cLedgerShopsTemp));

    final cHerdersTemp =
        await closingsService.getClosingsHerdersRpc.request(null);
    closingLedgerHerders = ObservableList.of(Iterable.castFrom(cHerdersTemp));

    final cStocksTemp =
        await closingsService.getClosingsStocksRpc.request(null);
    closingStocks = ObservableList.of(Iterable.castFrom(cStocksTemp));

    final cStockShopsTemp =
        await closingsService.getClosingsStockShopsRpc.request(null);
    closingStockShops = ObservableList.of(Iterable.castFrom(cStockShopsTemp));

    final cStockProductsTemp =
        await closingsService.getClosingsStockProductsRpc.request(null);
    closingStockProducts =
        ObservableList.of(Iterable.castFrom(cStockProductsTemp));

    final cHerderStocksTemp =
        await closingsService.getClosingsHerderStocksRpc.request(null);
    closingStockHerders =
        ObservableList.of(Iterable.castFrom(cHerderStocksTemp));
  }

  @action
  Future<ObservableList<ClosingRange>> addAllClosingRanges(
      List<ClosingRange> data) async {
    await closingsService.addAllClosingRangesRpc.request(data);
    closingRanges.addAll(data);
    return closingRanges;
  }

  @action
  Future<ObservableList<ClosingLedgerHerder>> addAllClosingLedgerHerders(
      List<ClosingLedgerHerder> data) async {
    await closingsService.addAllClosingsHerdersRpc.request(data);
    closingLedgerHerders.addAll(data);
    return closingLedgerHerders;
  }

  @action
  Future<ObservableList<ClosingStockHerder>> addAllClosingHerderStocks(
      List<ClosingStockHerder> data) async {
    await closingsService.addAllClosingsHerderStocksRpc.request(data);
    closingStockHerders.addAll(data);
    return closingStockHerders;
  }

  @action
  Future<ObservableList<ClosingLedger>> addAllClosingLedgers(
      List<ClosingLedger> data) async {
    await closingsService.addAllClosingLedgersRpc.request(data);
    closingLedgers.addAll(data);
    return closingLedgers;
  }

  @action
  Future<ObservableList<ClosingLedgerShop>> addAllClosingLedgerShops(
      List<ClosingLedgerShop> data) async {
    await closingsService.addAllClosingLedgerShopsRpc.request(data);
    closingLedgerShops.addAll(data);
    return closingLedgerShops;
  }

  @action
  Future<ObservableList<ClosingStock>> addAllClosingStocks(
      List<ClosingStock> data) async {
    await closingsService.addAllClosingsStocksRpc.request(data);
    closingStocks.addAll(data);
    // testing only since yobi does not look here
    for (final _cStock in data) {
      await closingsService.addAllClosingsStockProductsRpc
          .request(_cStock.products);
      closingStockProducts.addAll(_cStock.products);
    }
    return closingStocks;
  }

  @action
  Future<ObservableList<ClosingStockShop>> addAllClosingStockShops(
      List<ClosingStockShop> data) async {
    await closingsService.addAllClosingsStockShopsRpc.request(data);
    closingStockShops.addAll(data);
    // testing only since yobi does not look here
    return closingStockShops;
  }

  @action
  Future<ClosingRange> createClosingRange(ClosingRange data) async {
    final createdData =
        await closingsService.createClosingRangeRpc.request(data);
    closingRanges.add(createdData);
    return createdData;
  }

  @action
  Future<ObservableList<ClosingRange>> deleteClosingRange(
      ClosingRange _data) async {
    await closingsService.deleteClosingRangeRpc.request(_data);
    // print('length in store ${closingRanges.length}');
    closingRanges.remove(_data);
    // print('length in store ${closingRanges.length}');
    return closingRanges;
  }

  @action
  Future<bool> deleteAllClosingObjects() async {
    try {
      await closingsService.deleteAllClosingObjects.request([]);
      closingRanges = ObservableList.of([]);
      closingLedgers = ObservableList.of([]);
      closingLedgerShops = ObservableList.of([]);
      closingLedgerHerders = ObservableList.of([]);
      closingStockHerders = ObservableList.of([]);
      closingStocks = ObservableList.of([]);
      closingStockShops = ObservableList.of([]);
      closingStockProducts = ObservableList.of([]);
      return true;
    } catch (e) {
      print('erreur suppression clotures $e');
      return false;
    }
  }

  // -------
  // CRUD above
  // -------

  @action
  int rangeMarginRaw(
          DateTime firstDate, DateTime lastDate, List<String> shopUuids) =>
      sumLedgerShopsTicketTypeRange(
        shopUuids,
        '${TicketType.sell}',
        firstDate,
        lastDate,
      ) -
      sumLedgerShopsTicketTypeRange(
        shopUuids,
        '${TicketType.spend}',
        firstDate,
        lastDate,
      ) -
      sumLedgerShopsTicketTypeRange(
        shopUuids,
        '${TicketType.wage}',
        firstDate,
        lastDate,
      );

  @computed
  int get sumSell => closingLedgers.fold(0, (pv, e) => pv += e.sell);

  @computed
  int get sumSellCovered =>
      closingLedgers.fold(0, (pv, e) => pv += e.sellCovered);

  @computed
  int get sumSellDeferred =>
      closingLedgers.fold(0, (pv, e) => pv += e.sellDeferred);

  @computed
  int get sumSpend => closingLedgers.fold(0, (pv, e) => pv += e.spend);

  @computed
  int get sumSpendCovered =>
      closingLedgers.fold(0, (pv, e) => pv += e.spendCovered);

  @computed
  int get sumSpendDeferred =>
      closingLedgers.fold(0, (pv, e) => pv += e.spendDeferred);

  @computed
  int get sumWages => closingLedgers.fold(0, (pv, e) => pv += e.wage);

  @action
  int closingHerderLastBalance(int herderId) {
    if (closingLedgerHerders.isEmpty) {
      return 0;
    } else {
      final filtered = closingLedgerHerders
          .where((element) => element.herderId == '$herderId')
          .toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
      if (filtered.isEmpty) {
        return 0;
      } else {
        return filtered.last.balance;
      }
    }
  }

  @action
  int sellDeferredBeforeDate(int herderId, DateTime date) =>
      closingLedgerHerders
          .where((e) => e.herderId == '$herderId')
          .where((element) =>
              element.closingRange.endDate.isBefore(date) ||
              element.closingRange.endDate.isAtSameMomentAs(date))
          .fold(0, (prev, e) => prev + e.sellDeferred);
  @action
  int sellCoveredBeforeDate(int herderId, DateTime date) => closingLedgerHerders
      .where((e) => e.herderId == '$herderId')
      .where((element) =>
          element.closingRange.endDate.isBefore(date) ||
          element.closingRange.endDate.isAtSameMomentAs(date))
      .fold(0, (prev, e) => prev + e.sellCovered);
  @action
  int spendDeferredBeforeDate(int herderId, DateTime date) =>
      closingLedgerHerders
          .where((element) => element.herderId == '$herderId')
          .where((element) =>
              element.closingRange.endDate.isBefore(date) ||
              element.closingRange.endDate.isAtSameMomentAs(date))
          .fold(0, (prev, e) => prev + e.spendDeferred);
  @action
  int spendCoveredBeforeDate(int herderId, DateTime date) =>
      closingLedgerHerders
          .where((e) => e.herderId == '$herderId')
          .where((e) =>
              e.closingRange.endDate.isBefore(date) ||
              e.closingRange.endDate.isAtSameMomentAs(date))
          .fold(0, (prev, e) => prev + e.spendCovered);

  @action
  int sumHerderTicketTypeRange(String herderId, String ticketType,
      {DateTime? start, DateTime? end}) {
    // if date range provided, filter by dates
    final cHerderList = (start != null && end != null)
        ? closingLedgerHerders
            .filterByRange(start, end)
            .where((e) => e.herderId == herderId)
        : closingLedgerHerders.where((e) => e.herderId == herderId);

    switch (TicketType.tryParse(ticketType)) {
      case TicketType.sell:
        return cHerderList.fold(0, (pv, e) => pv += e.sell);

      case TicketType.sellDeferred:
        return cHerderList.fold(0, (pv, e) => pv += e.sellDeferred);

      case TicketType.sellCovered:
        return cHerderList.fold(0, (pv, e) => pv += e.sellCovered);

      case TicketType.spend:
        return cHerderList.fold(0, (pv, e) => pv += e.spend);

      case TicketType.spendDeferred:
        return cHerderList.fold(0, (pv, e) => pv += e.spendDeferred);

      case TicketType.spendCovered:
        return cHerderList.fold(0, (pv, e) => pv += e.spendCovered);

      case TicketType.wage:
        return cHerderList.fold(0, (pv, e) => pv += e.wage);

      case TicketType.unknown:
        throw ('rhaaaa unknow ticket type in sumHerderTicketTypeRange, not again !');
      default:
        return 0;
    }
  }

  @action
  int sumLedgerShopsTicketTypeRange(
      List<String> shopUuids, String ticketType, DateTime start, DateTime end) {
    var tt = 0;
    final _closingLedgerShops = <ClosingLedgerShop>[];
    if (shopUuids.isNotEmpty && closingLedgerShops.isNotEmpty) {
      if (closingLedgerShops.filterByRange(start, end).isNotEmpty) {
        _closingLedgerShops
            .addAll(closingLedgerShops.filterByRange(start, end));
      } else {
        //print('no _closingLedgerShops');
        return tt;
      }

      for (final uuid in shopUuids) {
        final filterByShop =
            _closingLedgerShops.where((cL) => cL.shopUuid == uuid);
        switch (TicketType.tryParse(ticketType)) {
          case TicketType.sell:
            filterByShop.forEach((e) => tt += e.sell);
            break;
          case TicketType.sellDeferred:
            filterByShop.forEach((e) => tt += e.sellDeferred);
            break;
          case TicketType.sellCovered:
            filterByShop.forEach((e) => tt += e.sellCovered);
            break;
          case TicketType.spend:
            filterByShop.forEach((e) => tt += e.spend);
            break;
          case TicketType.spendDeferred:
            filterByShop.forEach((e) => tt += e.spendDeferred);
            break;
          case TicketType.spendCovered:
            filterByShop.forEach((e) => tt += e.spendCovered);
            break;
          case TicketType.wage:
            filterByShop.forEach((e) => tt += e.wage);
            break;
          case TicketType.unknown:
            print('TicketType.unknown in sumLedgerShopsTicketTypeRange');
            break;
          default:
            print('TicketType is null sumLedgerShopsTicketTypeRange kai kai');
            return 0;
        }
      }
    }
    return tt;
  }

  @action
  int herderLastBalance(String herderId, {DateTime? end}) {
    if (closingLedgerHerders.isEmpty) {
      return 0;
    }
    final clist = end == null
        ? closingLedgerHerders
        : closingLedgerHerders
            .where((element) => element.closingRange.endDate.isBefore(end));
    clist.toList().sort(
        (a, b) => a.closingRange.startDate.compareTo(b.closingRange.startDate));
    final temp = closingLedgerHerders
            .firstWhereOrNull((e) => e.herderId == herderId)
            ?.balance ??
        0;
    // print('herderLastBalance $temp');
    return temp;
  }

  //--------------------------------
  // ** STOCK **
  //--------------------------------
  @action
  Observable<double> stockProductFinalQuantity(int productId, {DateTime? end}) {
    if (closingStocks.isEmpty) {
      return Observable(0.0);
    }
    final filterByDates = List.of(<ClosingStock>[]);
    if (end != null) {
      filterByDates.addAll(closingStocks
          .where((c) =>
              c.closingRange.endDate.isBefore(end) ||
              c.closingRange.endDate.isAtSameMomentAs(end))
          .toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate)));
    } else {
      filterByDates.addAll(closingStocks.toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate)));
    }
    final _stockProductFinalQuantity = filterByDates.last.products
            .firstWhereOrNull((element) => element.id == productId)
            ?.finalQtCl ??
        0.0;
    // print('_stockProductFinalQuantity $_stockProductFinalQuantity');
    return Observable(_stockProductFinalQuantity);
  }

  @action
  Observable<double> stockArticleFinalQuantity(int productId, int articleId,
      {DateTime? end}) {
    if (closingStocks.isEmpty) {
      return Observable(0.0);
    }
    var filterByDates = List.of(<ClosingStock>[]);
    if (end != null) {
      filterByDates = closingStocks
          .where((c) =>
              c.closingRange.endDate.isBefore(end) ||
              c.closingRange.endDate.isAtSameMomentAs(end))
          .toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
    } else {
      filterByDates = closingStocks.toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
    }
    final _stockProductFinalQuantity = filterByDates.last.products
            .firstWhereOrNull((e) => e.id == productId)
            ?.articles
            .firstWhereOrNull((element) =>
                element.id == articleId && element.productId == productId)
            ?.finalQtCl ??
        0.0;
    return Observable(_stockProductFinalQuantity);
  }

  @action
  Observable<double> stockArticleQuantityOut(int productId, int articleId,
      {DateTime? end}) {
    if (closingStocks.isEmpty) {
      return Observable(0.0);
    }
    var filterByDates = List.of(<ClosingStock>[]);
    if (end != null) {
      filterByDates = closingStocks
          .where((c) =>
              c.closingRange.endDate.isBefore(end) ||
              c.closingRange.endDate.isAtSameMomentAs(end))
          .toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
    } else {
      filterByDates = closingStocks.toList()
        ..sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
    }
    final qtOut = filterByDates.last.products
            .firstWhereOrNull((e) => e.id == productId)
            ?.articles
            .firstWhereOrNull((element) =>
                element.id == articleId && element.productId == productId)
            ?.quantityOut ??
        0.0;
    return Observable(qtOut);
  }

  @action
  Observable<double> stockShopProductFinalQuantityAbsolute(
      List<String> shopUuids, int productId,
      {DateTime? end}) {
    var daDiff = 0.0;
    if (shopUuids.isEmpty || closingStockShops.isEmpty) {
      return Observable(0.0);
    }
    var filterByDates = List<ClosingStockShop>.of([]);
    if (end != null) {
      filterByDates = closingStockShops
          .where((c) =>
              c.closingRange.endDate.isBefore(end) ||
              c.closingRange.endDate.isAtSameMomentAs(end))
          .toList();
    } else {
      filterByDates = closingStockShops.toList();
    }
    for (final uuid in shopUuids) {
      // ignore: omit_local_variable_types
      final List<ClosingStockShop<ClosingStockShopProduct>> filterByUuid =
          filterByDates.where((e) => e.shopUuid == uuid).toList();
      if (filterByUuid.isNotEmpty) {
        filterByUuid.sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
        daDiff += filterByUuid.last.products
                .firstWhereOrNull((element) => element.id == productId)
                ?.finalQtCl ??
            0.0;
      }
    }
    return Observable(daDiff);
  }

  @action
  Observable<double> stockShopArticleFinalQuantityAbsolute(
      List<String> shopUuids, int articleProductId, int articleId,
      {DateTime? end}) {
    var finalQtAllShopsSummed = 0.0;
    if (shopUuids.isEmpty || closingStockShops.isEmpty) {
      return Observable(0.0);
    }
    var filterByDates = List<ClosingStockShop>.of([]);
    if (end != null) {
      filterByDates = closingStockShops
          .where((c) =>
              c.closingRange.endDate.isBefore(end) ||
              c.closingRange.endDate.isAtSameMomentAs(end))
          .toList();
    } else {
      filterByDates = closingStockShops.toList();
    }
    for (final uuid in shopUuids) {
      final filterByShop = filterByDates.where((e) => e.shopUuid == uuid);
      if (filterByShop.isNotEmpty) {
        filterByShop.toList().sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
        final daObject = filterByShop.last;
        finalQtAllShopsSummed += daObject.products
                .firstWhereOrNull((e) => e.id == articleProductId)
                ?.articles
                .firstWhereOrNull((element) =>
                    element.id == articleId &&
                    element.productId == articleProductId)
                ?.finalQtCl ??
            0.0;
      }
    }
    return Observable(finalQtAllShopsSummed);
  }

  @action
  Observable<double> stockShopProductDiffTimeRange(
      List<String> shopUuids, int productId, DateTime start, DateTime end) {
    var finalQtSum = 0.0;
    var initQtSum = 0.0;

    if (shopUuids.isEmpty || closingStockShops.isEmpty) {
      return Observable(0.0);
    }
    if (closingStockShops.filterByRange(start, end).isEmpty) {
      print(
          'stockShopProductDiffTimeRange : filterByRange($start, $end) is empty && filterByStartDate(start) is empty');
      return Observable(0.0);
    }
    final filterByDates = List<ClosingStockShop>.of([]);
    filterByDates.addAll(closingStockShops.filterByRange(start, end));
    if (shopUuids.isNotEmpty) {
      for (final uuid in shopUuids) {
        if (filterByDates.any((e) => e.shopUuid == uuid) == false) {
          print('shopUuids is Empty OR filterByDates is Empty');
          return Observable(0.0);
        }
        finalQtSum +=
            filterByDates.where((shopCl) => shopCl.shopUuid == uuid).fold(
                      0.0,
                      (prev, shopCl) =>
                          prev! +
                          shopCl.products
                              .where((e) => e.id == productId)
                              .fold(0.0, (pv, e) => pv + e.finalQtCl),
                    ) ??
                0.0;
        initQtSum +=
            filterByDates.where((shopCl) => shopCl.shopUuid == uuid).fold(
                      0.0,
                      (pv, shopCl) =>
                          pv! +
                          shopCl.products.where((e) => e.id == productId).fold(
                              0.0, (pvs, element) => pvs + element.initialQtCl),
                    ) ??
                0.0;
      }
      //print('$uuid $productId initQtSum $initQtSum');
      //print('$uuid $productId finalQtSum $finalQtSum');
    }
    return Observable(finalQtSum - initQtSum);
  }

  @action
  Observable<double> stockShopArticleQtInTimeRange(List<String> shopUuids,
      int articleProductId, int articleId, DateTime start, DateTime end) {
    var qtIn = 0.0;
    if (shopUuids.isEmpty || closingStockShops.isEmpty) {
      print('shopUuids is Empty OR closingStockShops is Empty');
      return Observable(0.0);
    }
    if (closingStockShops.filterByRange(start, end).isEmpty) {
      print('no match');
      return Observable(0.0);
    }
    final filterByDates = List<ClosingStockShop>.of([]);
    filterByDates.addAll(closingStockShops.filterByRange(start, end));
    for (final uuid in shopUuids) {
      qtIn += filterByDates.where((element) => element.shopUuid == uuid).fold(
              0.0,
              (prev, shopCl) =>
                  prev! +
                  shopCl.products.where((p) => p.id == articleProductId).fold(
                        0.0,
                        (previous, product) =>
                            previous +
                            product.articles
                                .where((a) =>
                                    a.id == articleId &&
                                    a.productId == articleProductId)
                                .fold(
                                    0.0,
                                    (previousStuff, article) =>
                                        previousStuff + article.quantityIn),
                      )) ??
          0.0;
    }
    return Observable(qtIn);
  }

  @action
  Observable<double> stockShopArticleQtOutTimeRange(List<String> shopUuids,
      int articleProductId, int articleId, DateTime start, DateTime end) {
    var qtOut = 0.0;
    if (shopUuids.isEmpty || closingStockShops.isEmpty) {
      print('shopUuids is Empty OR closingStockShops is Empty');
      return Observable(0.0);
    }
    if (closingStockShops.filterByRange(start, end).isEmpty) {
      print('no match');
      return Observable(0.0);
    }

    final filterByDates = List<ClosingStockShop>.of([]);
    filterByDates.addAll(closingStockShops.filterByRange(start, end));
    for (final uuid in shopUuids) {
      qtOut += filterByDates.where((e) => e.shopUuid == uuid).fold(
              0.0,
              (previousNum, shopCl) =>
                  previousNum! +
                  shopCl.products.where((p) => p.id == articleProductId).fold(
                        0.0,
                        (previous, product) =>
                            previous +
                            product.articles
                                .where((a) =>
                                    a.productId == articleProductId &&
                                    a.id == articleId)
                                .fold(
                                    0.0,
                                    (prev, article) =>
                                        prev + article.quantityOut),
                      )) ??
          0.0;
    }
    return Observable(qtOut);
  }

  @action
  double herderStockProductFinalQuantity(
      DateTime end, int herderId, int productId) {
    var daList =
        closingStockHerders.where((c) => c.herderId == '$herderId').toList();
    if (daList.isEmpty) {
      print('closingHerderStocks list found no match');
      return 0.0;
    }
    daList = daList
      ..sort((a, b) => a.closingRange.endDate.compareTo(b.closingRange.endDate))
      ..toList();
    return daList.last.products
            .firstWhereOrNull((cssp) => cssp.id == productId)
            ?.finalQtCl ??
        0.0;
  }
}
