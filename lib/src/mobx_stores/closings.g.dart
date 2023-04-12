// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClosingsStore<S extends ClosingsServiceAbstract>
    on ClosingsStoreBase<S>, Store {
  Computed<int> _$sumSellComputed;

  @override
  int get sumSell => (_$sumSellComputed ??=
          Computed<int>(() => super.sumSell, name: 'ClosingsStoreBase.sumSell'))
      .value;
  Computed<int> _$sumSellCoveredComputed;

  @override
  int get sumSellCovered =>
      (_$sumSellCoveredComputed ??= Computed<int>(() => super.sumSellCovered,
              name: 'ClosingsStoreBase.sumSellCovered'))
          .value;
  Computed<int> _$sumSellDeferredComputed;

  @override
  int get sumSellDeferred =>
      (_$sumSellDeferredComputed ??= Computed<int>(() => super.sumSellDeferred,
              name: 'ClosingsStoreBase.sumSellDeferred'))
          .value;
  Computed<int> _$sumSpendComputed;

  @override
  int get sumSpend =>
      (_$sumSpendComputed ??= Computed<int>(() => super.sumSpend,
              name: 'ClosingsStoreBase.sumSpend'))
          .value;
  Computed<int> _$sumSpendCoveredComputed;

  @override
  int get sumSpendCovered =>
      (_$sumSpendCoveredComputed ??= Computed<int>(() => super.sumSpendCovered,
              name: 'ClosingsStoreBase.sumSpendCovered'))
          .value;
  Computed<int> _$sumSpendDeferredComputed;

  @override
  int get sumSpendDeferred => (_$sumSpendDeferredComputed ??= Computed<int>(
          () => super.sumSpendDeferred,
          name: 'ClosingsStoreBase.sumSpendDeferred'))
      .value;
  Computed<int> _$sumWagesComputed;

  @override
  int get sumWages =>
      (_$sumWagesComputed ??= Computed<int>(() => super.sumWages,
              name: 'ClosingsStoreBase.sumWages'))
          .value;

  final _$initialLoadingAtom =
      Atom(name: 'ClosingsStoreBase.initialLoading');

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

  final _$closingRangesAtom =
      Atom(name: 'ClosingsStoreBase.closingRanges');

  @override
  ObservableList<ClosingRange> get closingRanges {
    _$closingRangesAtom.reportRead();
    return super.closingRanges;
  }

  @override
  set closingRanges(ObservableList<ClosingRange> value) {
    _$closingRangesAtom.reportWrite(value, super.closingRanges, () {
      super.closingRanges = value;
    });
  }

  final _$closingLedgersAtom =
      Atom(name: 'ClosingsStoreBase.closingLedgers');

  @override
  ObservableList<ClosingLedger> get closingLedgers {
    _$closingLedgersAtom.reportRead();
    return super.closingLedgers;
  }

  @override
  set closingLedgers(ObservableList<ClosingLedger> value) {
    _$closingLedgersAtom.reportWrite(value, super.closingLedgers, () {
      super.closingLedgers = value;
    });
  }

  final _$closingLedgerShopsAtom =
      Atom(name: 'ClosingsStoreBase.closingLedgerShops');

  @override
  ObservableList<ClosingLedgerShop> get closingLedgerShops {
    _$closingLedgerShopsAtom.reportRead();
    return super.closingLedgerShops;
  }

  @override
  set closingLedgerShops(ObservableList<ClosingLedgerShop> value) {
    _$closingLedgerShopsAtom.reportWrite(value, super.closingLedgerShops, () {
      super.closingLedgerShops = value;
    });
  }

  final _$closingLedgerHerdersAtom =
      Atom(name: 'ClosingsStoreBase.closingLedgerHerders');

  @override
  ObservableList<ClosingLedgerHerder> get closingLedgerHerders {
    _$closingLedgerHerdersAtom.reportRead();
    return super.closingLedgerHerders;
  }

  @override
  set closingLedgerHerders(ObservableList<ClosingLedgerHerder> value) {
    _$closingLedgerHerdersAtom.reportWrite(value, super.closingLedgerHerders,
        () {
      super.closingLedgerHerders = value;
    });
  }

  final _$closingStockHerdersAtom =
      Atom(name: 'ClosingsStoreBase.closingStockHerders');

  @override
  ObservableList<ClosingStockHerder> get closingStockHerders {
    _$closingStockHerdersAtom.reportRead();
    return super.closingStockHerders;
  }

  @override
  set closingStockHerders(ObservableList<ClosingStockHerder> value) {
    _$closingStockHerdersAtom.reportWrite(value, super.closingStockHerders, () {
      super.closingStockHerders = value;
    });
  }

  final _$closingStocksAtom =
      Atom(name: 'ClosingsStoreBase.closingStocks');

  @override
  ObservableList<ClosingStock<ClosingStockProduct>> get closingStocks {
    _$closingStocksAtom.reportRead();
    return super.closingStocks;
  }

  @override
  set closingStocks(ObservableList<ClosingStock<ClosingStockProduct>> value) {
    _$closingStocksAtom.reportWrite(value, super.closingStocks, () {
      super.closingStocks = value;
    });
  }

  final _$closingStockShopsAtom =
      Atom(name: 'ClosingsStoreBase.closingStockShops');

  @override
  ObservableList<ClosingStockShop<ClosingStockShopProduct>>
      get closingStockShops {
    _$closingStockShopsAtom.reportRead();
    return super.closingStockShops;
  }

  @override
  set closingStockShops(
      ObservableList<ClosingStockShop<ClosingStockShopProduct>> value) {
    _$closingStockShopsAtom.reportWrite(value, super.closingStockShops, () {
      super.closingStockShops = value;
    });
  }

  final _$closingStockProductsAtom =
      Atom(name: 'ClosingsStoreBase.closingStockProducts');

  @override
  ObservableList<ClosingStockProduct> get closingStockProducts {
    _$closingStockProductsAtom.reportRead();
    return super.closingStockProducts;
  }

  @override
  set closingStockProducts(ObservableList<ClosingStockProduct> value) {
    _$closingStockProductsAtom.reportWrite(value, super.closingStockProducts,
        () {
      super.closingStockProducts = value;
    });
  }

  final _$initAsyncAction =
      AsyncAction('ClosingsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$loadTasksAsyncAction =
      AsyncAction('ClosingsStoreBase.loadTasks');

  @override
  Future<void> loadTasks() {
    return _$loadTasksAsyncAction.run(() => super.loadTasks());
  }

  final _$addAllClosingRangesAsyncAction =
      AsyncAction('ClosingsStoreBase.addAllClosingRanges');

  @override
  Future<ObservableList<ClosingRange>> addAllClosingRanges(
      List<ClosingRange> data) {
    return _$addAllClosingRangesAsyncAction
        .run(() => super.addAllClosingRanges(data));
  }

  final _$addAllClosingLedgerHerdersAsyncAction = AsyncAction(
      'ClosingsStoreBase.addAllClosingLedgerHerders',
  );

  @override
  Future<ObservableList<ClosingLedgerHerder>> addAllClosingLedgerHerders(
      List<ClosingLedgerHerder> data) {
    return _$addAllClosingLedgerHerdersAsyncAction
        .run(() => super.addAllClosingLedgerHerders(data));
  }

  final _$addAllClosingHerderStocksAsyncAction = AsyncAction(
      'ClosingsStoreBase.addAllClosingHerderStocks',
  );

  @override
  Future<ObservableList<ClosingStockHerder>> addAllClosingHerderStocks(
      List<ClosingStockHerder> data) {
    return _$addAllClosingHerderStocksAsyncAction
        .run(() => super.addAllClosingHerderStocks(data));
  }

  final _$addAllClosingLedgersAsyncAction =
      AsyncAction('ClosingsStoreBase.addAllClosingLedgers');

  @override
  Future<ObservableList<ClosingLedger>> addAllClosingLedgers(
      List<ClosingLedger> data) {
    return _$addAllClosingLedgersAsyncAction
        .run(() => super.addAllClosingLedgers(data));
  }

  final _$addAllClosingLedgerShopsAsyncAction = AsyncAction(
      'ClosingsStoreBase.addAllClosingLedgerShops',
  );

  @override
  Future<ObservableList<ClosingLedgerShop>> addAllClosingLedgerShops(
      List<ClosingLedgerShop> data) {
    return _$addAllClosingLedgerShopsAsyncAction
        .run(() => super.addAllClosingLedgerShops(data));
  }

  final _$addAllClosingStocksAsyncAction =
      AsyncAction('ClosingsStoreBase.addAllClosingStocks');

  @override
  Future<ObservableList<ClosingStock<ClosingStockProduct>>> addAllClosingStocks(
      List<ClosingStock<ClosingStockProduct>> data) {
    return _$addAllClosingStocksAsyncAction
        .run(() => super.addAllClosingStocks(data));
  }

  final _$addAllClosingStockShopsAsyncAction = AsyncAction(
      'ClosingsStoreBase.addAllClosingStockShops',
  );

  @override
  Future<ObservableList<ClosingStockShop<ClosingStockShopProduct>>>
      addAllClosingStockShops(
          List<ClosingStockShop<ClosingStockShopProduct>> data) {
    return _$addAllClosingStockShopsAsyncAction
        .run(() => super.addAllClosingStockShops(data));
  }

  final _$createClosingRangeAsyncAction =
      AsyncAction('ClosingsStoreBase.createClosingRange');

  @override
  Future<ClosingRange> createClosingRange(ClosingRange data) {
    return _$createClosingRangeAsyncAction
        .run(() => super.createClosingRange(data));
  }

  final _$deleteClosingRangeAsyncAction =
      AsyncAction('ClosingsStoreBase.deleteClosingRange');

  @override
  Future<ObservableList<ClosingRange>> deleteClosingRange(ClosingRange _data) {
    return _$deleteClosingRangeAsyncAction
        .run(() => super.deleteClosingRange(_data));
  }

  final _$deleteAllClosingObjectsAsyncAction = AsyncAction(
      'ClosingsStoreBase.deleteAllClosingObjects',
  );

  @override
  Future<bool> deleteAllClosingObjects() {
    return _$deleteAllClosingObjectsAsyncAction
        .run(() => super.deleteAllClosingObjects());
  }

  final _$ClosingsStoreBaseActionController =
      ActionController(name: 'ClosingsStoreBase');

  @override
  int rangeMarginRaw(
      DateTime firstDate, DateTime lastDate, List<String> shopUuids) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.rangeMarginRaw');
    try {
      return super.rangeMarginRaw(firstDate, lastDate, shopUuids);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int closingHerderLastBalance(int herderId) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.closingHerderLastBalance');
    try {
      return super.closingHerderLastBalance(herderId);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int sellDeferredBeforeDate(int herderId, DateTime date) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.sellDeferredBeforeDate');
    try {
      return super.sellDeferredBeforeDate(herderId, date);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int sellCoveredBeforeDate(int herderId, DateTime date) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.sellCoveredBeforeDate');
    try {
      return super.sellCoveredBeforeDate(herderId, date);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int spendDeferredBeforeDate(int herderId, DateTime date) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.spendDeferredBeforeDate');
    try {
      return super.spendDeferredBeforeDate(herderId, date);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int spendCoveredBeforeDate(int herderId, DateTime date) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.spendCoveredBeforeDate');
    try {
      return super.spendCoveredBeforeDate(herderId, date);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int sumHerderTicketTypeRange(String herderId, String ticketType,
      {DateTime start, DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.sumHerderTicketTypeRange');
    try {
      return super.sumHerderTicketTypeRange(herderId, ticketType,
          start: start, end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int sumLedgerShopsTicketTypeRange(
      List<String> shopUuids, String ticketType, DateTime start, DateTime end) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.sumLedgerShopsTicketTypeRange');
    try {
      return super
          .sumLedgerShopsTicketTypeRange(shopUuids, ticketType, start, end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int herderLastBalance(String herderId, {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.herderLastBalance');
    try {
      return super.herderLastBalance(herderId, end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockProductFinalQuantity(int productId, {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockProductFinalQuantity');
    try {
      return super.stockProductFinalQuantity(productId, end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockArticleFinalQuantity(int productId, int articleId,
      {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockArticleFinalQuantity');
    try {
      return super.stockArticleFinalQuantity(productId, articleId, end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockArticleQuantityOut(int productId, int articleId,
      {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockArticleQuantityOut');
    try {
      return super.stockArticleQuantityOut(productId, articleId, end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockShopProductFinalQuantityAbsolute(
      List<String> shopUuids, int productId,
      {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockShopProductFinalQuantityAbsolute');
    try {
      return super.stockShopProductFinalQuantityAbsolute(shopUuids, productId,
          end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockShopArticleFinalQuantityAbsolute(
      List<String> shopUuids, int articleProductId, int articleId,
      {DateTime end}) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockShopArticleFinalQuantityAbsolute');
    try {
      return super.stockShopArticleFinalQuantityAbsolute(
          shopUuids, articleProductId, articleId,
          end: end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockShopProductDiffTimeRange(
      List<String> shopUuids, int productId, DateTime start, DateTime end) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockShopProductDiffTimeRange');
    try {
      return super
          .stockShopProductDiffTimeRange(shopUuids, productId, start, end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockShopArticleQtInTimeRange(List<String> shopUuids,
      int articleProductId, int articleId, DateTime start, DateTime end) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockShopArticleQtInTimeRange');
    try {
      return super.stockShopArticleQtInTimeRange(
          shopUuids, articleProductId, articleId, start, end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Observable<double> stockShopArticleQtOutTimeRange(List<String> shopUuids,
      int articleProductId, int articleId, DateTime start, DateTime end) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.stockShopArticleQtOutTimeRange');
    try {
      return super.stockShopArticleQtOutTimeRange(
          shopUuids, articleProductId, articleId, start, end);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double herderStockProductFinalQuantity(
      DateTime end, int herderId, int productId) {
    final _$actionInfo = _$ClosingsStoreBaseActionController.startAction(
        name: 'ClosingsStoreBase.herderStockProductFinalQuantity');
    try {
      return super.herderStockProductFinalQuantity(end, herderId, productId);
    } finally {
      _$ClosingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialLoading: ${initialLoading},
closingRanges: ${closingRanges},
closingLedgers: ${closingLedgers},
closingLedgerShops: ${closingLedgerShops},
closingLedgerHerders: ${closingLedgerHerders},
closingStockHerders: ${closingStockHerders},
closingStocks: ${closingStocks},
closingStockShops: ${closingStockShops},
closingStockProducts: ${closingStockProducts},
sumSell: ${sumSell},
sumSellCovered: ${sumSellCovered},
sumSellDeferred: ${sumSellDeferred},
sumSpend: ${sumSpend},
sumSpendCovered: ${sumSpendCovered},
sumSpendDeferred: ${sumSpendDeferred},
sumWages: ${sumWages}
    ''';
  }
}
