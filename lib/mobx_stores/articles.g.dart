// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArticlesStore on ArticlesStoreBase, Store {
  late Computed<ObservableList<LineOfArticles>> _$productsInSellComputed;

  @override
  ObservableList<LineOfArticles> get linesInSell =>
      (_$productsInSellComputed ??= Computed<ObservableList<LineOfArticles>>(
              () => super.linesInSell,
              name: 'ArticlesStoreBase.linesInSell'))
          .value;

  late Computed<ObservableList<LineOfArticles>> _$linesPalpableNoBasket;

  @override
  ObservableList<LineOfArticles> get linesPalpableNoBasket =>
      (_$linesPalpableNoBasket ??= Computed<ObservableList<LineOfArticles>>(
              () => super.linesPalpableNoBasket,
              name: 'ArticlesStoreBase.linesPalpableNoBasket'))
          .value;

  late Computed<ObservableList<Article>> _$articlesWeebiList;

  @override
  ObservableList<Article> get articlesWeebiList => (_$articlesWeebiList ??=
          Computed<ObservableList<Article>>(() => super.articlesWeebiList,
              name: 'ArticlesStoreBase.articlesWeebiList'))
      .value;
  late Computed<ObservableList<String>> _$getSuggestions;

  @override
  ObservableList<String> get getSuggestions => (_$getSuggestions ??=
          Computed<ObservableList<String>>(() => super.getSuggestions,
              name: 'ArticlesStoreBase.getSuggestions'))
      .value;

  final _$initialLoadingAtom = Atom(name: 'ArticlesStoreBase.initialLoading');

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

  final _$isFilterAtom = Atom(name: 'ArticlesStoreBase.isFilter');
  final _$isFilterPrivateAtom =
      Atom(name: 'ArticlesStoreBase._isFilterPrivate');

  @override
  bool get isFilter {
    _$isFilterAtom.reportRead();
    return super.isFilter;
  }

  @override
  bool get _isFilterPrivate {
    _$isFilterPrivateAtom.reportRead();
    return super._isFilterPrivate;
  }

  @override
  set _isFilterPrivate(bool value) {
    _$isFilterPrivateAtom.reportWrite(value, super._isFilterPrivate, () {
      super._isFilterPrivate = value;
    });
  }

  @override
  void setIsFilter(bool val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.setIsFilter');
    try {
      return super.setIsFilter(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  final _$queryStringAtom = Atom(name: 'ArticlesStoreBase.queryString');
  final _$queryStringPrivateAtom =
      Atom(name: 'ArticlesStoreBase._queryStringPrivate');

  @override
  String get queryString {
    _$queryStringAtom.reportRead();
    return super.queryString;
  }

  @override
  String get _queryStringPrivate {
    _$queryStringPrivateAtom.reportRead();
    return super._queryStringPrivate;
  }

  @override
  set _queryStringPrivate(String value) {
    _$queryStringPrivateAtom.reportWrite(value, super._queryStringPrivate, () {
      super._queryStringPrivate = value;
    });
  }

  @override
  void setQueryString(String val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.setQueryString');
    try {
      return super.setQueryString(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArticleWInSelected(ArticleWMinQt val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.addArticleWInSelected');
    try {
      return super.addArticleWInSelected(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ArticleWMinQt findSingleArticleBasedOnFullName(String val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.findSingleArticleBasedOnFullName');
    try {
      return super.findSingleArticleBasedOnFullName(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArticleMinQtInSelected(ArticleWMinQt val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.removeArticleWInSelected');
    try {
      return super.removeArticleMinQtInSelected(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateArticleMinQtInSelected(ArticleWMinQt article, double minQt) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.updateMinQtArticleWInSelected');
    try {
      return super.updateArticleMinQtInSelected(article, minQt);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllArticleMinQtInSelected() {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.clearAllArticleMinQtInSelected');
    try {
      return super.clearAllArticleMinQtInSelected();
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  final _$filteredByAtom = Atom(name: 'ArticlesStoreBase.filteredBy');
  final _$filteredByPrivateAtom =
      Atom(name: 'ArticlesStoreBase._filteredByPrivate');

  @override
  FilteredBy get filteredBy {
    _$filteredByAtom.reportRead();
    return super.filteredBy;
  }

  @override
  FilteredBy get _filteredByPrivate {
    _$filteredByPrivateAtom.reportRead();
    return super._filteredByPrivate;
  }

  @override
  set _filteredByPrivate(FilteredBy value) {
    _$filteredByPrivateAtom.reportWrite(value, super._filteredByPrivate, () {
      super._filteredByPrivate = value;
    });
  }

  @override
  void setFilteredBy(FilteredBy val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.setFilteredBy');
    try {
      return super.setFilteredBy(val);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  final _$sortedByAtom = Atom(name: 'ArticlesStoreBase.sortedBy');

  @override
  SortedBy get sortedBy {
    _$sortedByAtom.reportRead();
    return super.sortedBy;
  }

  @override
  set sortedBy(SortedBy value) {
    _$sortedByAtom.reportWrite(value, super.sortedBy, () {
      super.sortedBy = value;
    });
  }

  final _$linesAtom = Atom(name: 'ArticlesStoreBase.lines');

  @override
  ObservableList<LineOfArticles> get lines {
    _$linesAtom.reportRead();
    return super.lines;
  }

  @override
  set lines(ObservableList<LineOfArticles> value) {
    _$linesAtom.reportWrite(value, super.lines, () {
      super.lines = value;
    });
  }

  final _$articlesSelectedAtom =
      Atom(name: 'ArticlesStoreBase.articlesSelected');

  @override
  ObservableList<ArticleWMinQt> get articlesSelectedForBasketMinQt {
    _$articlesSelectedAtom.reportRead();
    return super.articlesSelectedForBasketMinQt;
  }

  @override
  set articlesSelectedForBasketMinQt(ObservableList<ArticleWMinQt> value) {
    _$articlesSelectedAtom
        .reportWrite(value, super.articlesSelectedForBasketMinQt, () {
      super.articlesSelectedForBasketMinQt = value;
    });
  }

  final _$ArticlesStoreBaseActionController =
      ActionController(name: 'ArticlesStoreBase');

  @override
  ObservableList<LineOfArticles> sortBy(SortedBy sortedBy) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.sortBy');
    try {
      return super.sortBy(sortedBy);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  final _$initAsyncAction = AsyncAction('ArticlesStoreBase.init');
  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$addAllLinesAsyncAction = AsyncAction('ArticlesStoreBase.addAllLines');

  @override
  Future<int> addAllLines(List<LineOfArticles> _linesToSave) {
    return _$addAllLinesAsyncAction.run(() => super.addAllLines(_linesToSave));
  }

  final _$updateAllLinesThatMatchAsyncAction =
      AsyncAction('ArticlesStoreBase.updateAllLinesThatMatch');

  @override
  Future<int> updateAllLinesThatMatch(List<LineOfArticles> _linesToUpdate) {
    return _$updateAllLinesThatMatchAsyncAction
        .run(() => super.updateAllLinesThatMatch(_linesToUpdate));
  }

  final _$importCatalogueAsyncAction =
      AsyncAction('ArticlesStoreBase.importCatalogue');

  @override
  Future<ObservableList<LineOfArticles>> importCatalogueFromJson(String json) {
    return _$importCatalogueAsyncAction
        .run(() => super.importCatalogueFromJson(json));
  }

  final _$deleteAllProductsAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteAllProducts');

  @override
  Future<void> deleteAllArticlesAndLines() {
    return _$deleteAllProductsAsyncAction
        .run(() => super.deleteAllArticlesAndLines());
  }

  final _$createProductAsyncAction =
      AsyncAction('ArticlesStoreBase.createProduct');

  @override
  Future<LineOfArticles> createLineArticle<A extends ArticleAbstract>(
      LineOfArticles<A> lineData) {
    return _$createProductAsyncAction
        .run(() => super.createLineArticle(lineData));
  }

  final _$updateLineAsyncAction = AsyncAction('ArticlesStoreBase.updateLine');

  @override
  Future<LineOfArticles> updateLineArticle(LineOfArticles line) {
    return _$updateLineAsyncAction.run(() => super.updateLineArticle(line));
  }

  final _$stockLowProductAsyncAction =
      AsyncAction('ArticlesStoreBase.stockLowProduct');

  @override
  Future<LineOfArticles> stockLowWarning(LineOfArticles productFalse) {
    return _$stockLowProductAsyncAction
        .run(() => super.stockLowWarning(productFalse));
  }

  final _$restoreProductAsyncAction =
      AsyncAction('ArticlesStoreBase.restoreProduct');

  @override
  Future<LineOfArticles> restoreLineArticle(LineOfArticles productTrue) {
    return _$restoreProductAsyncAction
        .run(() => super.restoreLineArticle(productTrue));
  }

  final _$deleteForeverProductAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverProduct');

  @override
  Future<ObservableList<LineOfArticles>> deleteForeverLineArticle(
      LineOfArticles productData) {
    return _$deleteForeverProductAsyncAction
        .run(() => super.deleteForeverLineArticle(productData));
  }

  final _$deleteForeverArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverArticle');

  @override
  Future<ObservableList<LineOfArticles>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) {
    return _$deleteForeverArticleAsyncAction
        .run(() => super.deleteForeverArticle(articleData));
  }

  final _$createArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createArticle');

  @override
  Future<A> createArticle<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) {
    return _$createArticleAsyncAction
        .run(() => super.createArticle(articleData, isTest: isTest));
  }

  final _$updateArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateArticle');

  @override
  Future<A> updateArticle<A extends ArticleAbstract>(A articleData) {
    return _$updateArticleAsyncAction
        .run(() => super.updateArticle(articleData));
  }

  @override
  String toString() {
    return '''
initialLoading: ${initialLoading},
isFilter: ${isFilter},
products: ${lines},
stuff: ${articlesSelectedForBasketMinQt}
    ''';
  }
}
