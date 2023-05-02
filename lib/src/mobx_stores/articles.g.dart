// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticlesStore<S extends ArticlesServiceAbstract>
    on ArticlesStoreBase<S>, Store {
  Computed<ObservableList<ArticleLine<ArticleAbstract>>>
      _$linesPalpableNoBasketComputed;

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesPalpableNoBasket =>
      (_$linesPalpableNoBasketComputed ??=
              Computed<ObservableList<ArticleLine<ArticleAbstract>>>(
                  () => super.linesPalpableNoBasket,
                  name: 'ArticlesStoreBase.linesPalpableNoBasket'))
          .value;
  Computed<ObservableList<ArticleRetail>> _$articlesWeebiListComputed;

  @override
  ObservableList<ArticleRetail> get articlesWeebiList =>
      (_$articlesWeebiListComputed ??= Computed<ObservableList<ArticleRetail>>(
              () => super.articlesWeebiList,
              name: 'ArticlesStoreBase.articlesWeebiList'))
          .value;
  Computed<ObservableList<String>> _$getSuggestionsComputed;

  @override
  ObservableList<String> get getSuggestions => (_$getSuggestionsComputed ??=
          Computed<ObservableList<String>>(() => super.getSuggestions,
              name: 'ArticlesStoreBase.getSuggestions'))
      .value;
  Computed<ObservableList<ArticleLine<ArticleAbstract>>> _$linesInSellComputed;

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesInSell =>
      (_$linesInSellComputed ??=
              Computed<ObservableList<ArticleLine<ArticleAbstract>>>(
                  () => super.linesInSell,
                  name: 'ArticlesStoreBase.linesInSell'))
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

  final _$isSearchAtom = Atom(name: 'ArticlesStoreBase.isSearch');

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  final _$_filteredByPrivateAtom =
      Atom(name: 'ArticlesStoreBase._filteredByPrivate');

  @override
  FilteredBy get _filteredByPrivate {
    _$_filteredByPrivateAtom.reportRead();
    return super._filteredByPrivate;
  }

  @override
  set _filteredByPrivate(FilteredBy value) {
    _$_filteredByPrivateAtom.reportWrite(value, super._filteredByPrivate, () {
      super._filteredByPrivate = value;
    });
  }

  final _$_queryStringPrivateAtom =
      Atom(name: 'ArticlesStoreBase._queryStringPrivate');

  @override
  String get _queryStringPrivate {
    _$_queryStringPrivateAtom.reportRead();
    return super._queryStringPrivate;
  }

  @override
  set _queryStringPrivate(String value) {
    _$_queryStringPrivateAtom.reportWrite(value, super._queryStringPrivate, () {
      super._queryStringPrivate = value;
    });
  }

  final _$sortedByAtom = Atom(name: 'ArticlesStoreBase.sortedBy');

  @override
  Observable<SortedBy> get sortedBy {
    _$sortedByAtom.reportRead();
    return super.sortedBy;
  }

  @override
  set sortedBy(Observable<SortedBy> value) {
    _$sortedByAtom.reportWrite(value, super.sortedBy, () {
      super.sortedBy = value;
    });
  }

  final _$linesAtom = Atom(name: 'ArticlesStoreBase.lines');

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get lines {
    _$linesAtom.reportRead();
    return super.lines;
  }

  @override
  set lines(ObservableList<ArticleLine<ArticleAbstract>> value) {
    _$linesAtom.reportWrite(value, super.lines, () {
      super.lines = value;
    });
  }

  final _$linesPalpableFilteredAtom =
      Atom(name: 'ArticlesStoreBase.linesPalpableFiltered');

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesPalpableFiltered {
    _$linesPalpableFilteredAtom.reportRead();
    return super.linesPalpableFiltered;
  }

  @override
  set linesPalpableFiltered(
      ObservableList<ArticleLine<ArticleAbstract>> value) {
    _$linesPalpableFilteredAtom.reportWrite(value, super.linesPalpableFiltered,
        () {
      super.linesPalpableFiltered = value;
    });
  }

  final _$articlesSelectedForBasketMinQtAtom = Atom(
    name: 'ArticlesStoreBase.articlesSelectedForBasketMinQt',
  );

  @override
  ObservableList<ArticleWMinQt> get articlesSelectedForBasketMinQt {
    _$articlesSelectedForBasketMinQtAtom.reportRead();
    return super.articlesSelectedForBasketMinQt;
  }

  @override
  set articlesSelectedForBasketMinQt(ObservableList<ArticleWMinQt> value) {
    _$articlesSelectedForBasketMinQtAtom
        .reportWrite(value, super.articlesSelectedForBasketMinQt, () {
      super.articlesSelectedForBasketMinQt = value;
    });
  }

  final _$initAsyncAction = AsyncAction('ArticlesStoreBase.init');

  @override
  Future<bool> init({List<ArticleLine<ArticleAbstract>> data}) {
    return _$initAsyncAction.run(() => super.init(data: data));
  }

  final _$clearFilterAsyncAction = AsyncAction('ArticlesStoreBase.clearFilter');

  @override
  Future<void> clearFilter({List<ArticleLine<ArticleAbstract>> data}) {
    return _$clearFilterAsyncAction.run(() => super.clearFilter(data: data));
  }

  final _$addAllArticleLineAsyncAction =
      AsyncAction('ArticlesStoreBase.addAllArticleLine');

  @override
  Future<int> addAllArticleLine(
      List<ArticleLine<ArticleAbstract>> lineArticlesToSave) {
    return _$addAllArticleLineAsyncAction
        .run(() => super.addAllArticleLine(lineArticlesToSave));
  }

  final _$updateLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateLineArticle');

  @override
  Future<ArticleLine<ArticleAbstract>>
      updateLineArticle<A extends ArticleAbstract>(
          ArticleLine<ArticleAbstract> line) {
    return _$updateLineArticleAsyncAction
        .run(() => super.updateLineArticle(line));
  }

  final _$importCatalogueFromJsonAsyncAction = AsyncAction(
    'ArticlesStoreBase.importCatalogueFromJson',
  );

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>> importCatalogueFromJson(
      String json) {
    return _$importCatalogueFromJsonAsyncAction
        .run(() => super.importCatalogueFromJson(json));
  }

  final _$deleteAllArticlesAndLinesAsyncAction = AsyncAction(
    'ArticlesStoreBase.deleteAllArticlesAndLines',
  );

  @override
  Future<bool> deleteAllArticlesAndLines() {
    return _$deleteAllArticlesAndLinesAsyncAction
        .run(() => super.deleteAllArticlesAndLines());
  }

  final _$upsertAllBasedOnIdAsyncAction = AsyncAction(
    'ArticlesStoreBase.upsertAllBasedOnId',
  );

  @override
  Future<int> upsertAllBasedOnId(List<ArticleLine> articlesInTheBush) {
    return _$upsertAllBasedOnIdAsyncAction
        .run(() => super.upsertAllBasedOnId(articlesInTheBush));
  }

  final _$createLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createLineArticle');

  @override
  Future<ArticleLine<ArticleAbstract>>
      createLineArticle<A extends ArticleAbstract>(ArticleLine<A> lineData) {
    return _$createLineArticleAsyncAction
        .run(() => super.createLineArticle<A>(lineData));
  }

  final _$stockLowWarningAsyncAction =
      AsyncAction('ArticlesStoreBase.stockLowWarning');

  @override
  Future<ArticleLine<ArticleAbstract>> stockLowWarning(
      ArticleLine<ArticleAbstract> productFalse) {
    return _$stockLowWarningAsyncAction
        .run(() => super.stockLowWarning(productFalse));
  }

  final _$restoreLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.restoreLineArticle');

  @override
  Future<ArticleLine<ArticleAbstract>> restoreLineArticle(
      ArticleLine<ArticleAbstract> line) {
    return _$restoreLineArticleAsyncAction
        .run(() => super.restoreLineArticle(line));
  }

  final _$deleteForeverLineArticleAsyncAction = AsyncAction(
    'ArticlesStoreBase.deleteForeverLineArticle',
  );

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>> deleteForeverLineArticle(
      ArticleLine<ArticleAbstract> productData) {
    return _$deleteForeverLineArticleAsyncAction
        .run(() => super.deleteForeverLineArticle(productData));
  }

  final _$deleteForeverArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverArticle');

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) {
    return _$deleteForeverArticleAsyncAction
        .run(() => super.deleteForeverArticle<A>(articleData));
  }

  final _$createArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createArticle');

  @override
  Future<A> createArticle<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) {
    return _$createArticleAsyncAction
        .run(() => super.createArticle<A>(articleData, isTest: isTest));
  }

  final _$updateArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateArticle');

  @override
  Future<A> updateArticle<A extends ArticleAbstract>(A articleData) {
    return _$updateArticleAsyncAction
        .run(() => super.updateArticle<A>(articleData));
  }

  final _$ArticlesStoreBaseActionController =
      ActionController(name: 'ArticlesStoreBase');

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
  ArticleWMinQt findSingleArticleBasedOnFullName(String fullName) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.findSingleArticleBasedOnFullName');
    try {
      return super.findSingleArticleBasedOnFullName(fullName);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArticleWInSelected(ArticleWMinQt articleMinQt) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.addArticleWInSelected');
    try {
      return super.addArticleWInSelected(articleMinQt);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArticleMinQtInSelected(ArticleWMinQt article) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.removeArticleMinQtInSelected');
    try {
      return super.removeArticleMinQtInSelected(article);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateArticleMinQtInSelected(ArticleWMinQt article, double minQt) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.updateArticleMinQtInSelected');
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

  @override
  ObservableList<ArticleLine<ArticleAbstract>> sortBy(SortedBy sortBy) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.sortBy');
    try {
      return super.sortBy(sortBy);
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByTitle() {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.filterByTitle');
    try {
      return super.filterByTitle();
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialLoading: ${initialLoading},
isSearch: ${isSearch},
sortedBy: ${sortedBy},
lines: ${lines},
linesPalpableFiltered: ${linesPalpableFiltered},
articlesSelectedForBasketMinQt: ${articlesSelectedForBasketMinQt},
linesPalpableNoBasket: ${linesPalpableNoBasket},
articlesWeebiList: ${articlesWeebiList},
getSuggestions: ${getSuggestions},
linesInSell: ${linesInSell}
    ''';
  }
}
