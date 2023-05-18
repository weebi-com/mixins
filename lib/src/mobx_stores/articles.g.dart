// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticlesStore<S extends ArticlesServiceAbstract>
    on ArticlesStoreBase<S>, Store {
  Computed<ObservableList<ArticleLine<ArticleAbstract>>>?
      _$linesPalpableFilteredComputed;

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesPalpableFiltered =>
      (_$linesPalpableFilteredComputed ??=
              Computed<ObservableList<ArticleLine<ArticleAbstract>>>(
                  () => super.linesPalpableFiltered,
                  name: 'ArticlesStoreBase.linesPalpableFiltered'))
          .value;
  Computed<ObservableList<ArticleLine<ArticleAbstract>>>?
      _$linesNotQuikspendNotBasketComputed;

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesNotQuikspendNotBasket =>
      (_$linesNotQuikspendNotBasketComputed ??=
              Computed<ObservableList<ArticleLine<ArticleAbstract>>>(
                  () => super.linesNotQuikspendNotBasket,
                  name: 'ArticlesStoreBase.linesNotQuikspendNotBasket'))
          .value;
  Computed<ObservableList<ArticleRetail>>? _$articlesWeebiListComputed;

  @override
  ObservableList<ArticleRetail> get articlesWeebiList =>
      (_$articlesWeebiListComputed ??= Computed<ObservableList<ArticleRetail>>(
              () => super.articlesWeebiList,
              name: 'ArticlesStoreBase.articlesWeebiList'))
          .value;
  Computed<ObservableList<String>>? _$getSuggestionsComputed;

  @override
  ObservableList<String> get getSuggestions => (_$getSuggestionsComputed ??=
          Computed<ObservableList<String>>(() => super.getSuggestions,
              name: 'ArticlesStoreBase.getSuggestions'))
      .value;
  Computed<ObservableList<String>>? _$getLinesNamesComputed;

  @override
  ObservableList<String> get getLinesNames => (_$getLinesNamesComputed ??=
          Computed<ObservableList<String>>(() => super.getLinesNames,
              name: 'ArticlesStoreBase.getLinesNames'))
      .value;
  Computed<ObservableList<String>>? _$getArticlesFullNamesComputed;

  @override
  ObservableList<String> get getArticlesFullNames =>
      (_$getArticlesFullNamesComputed ??= Computed<ObservableList<String>>(
              () => super.getArticlesFullNames,
              name: 'ArticlesStoreBase.getArticlesFullNames'))
          .value;
  Computed<ObservableList<ArticleLine<ArticleAbstract>>>? _$linesInSellComputed;

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get linesInSell =>
      (_$linesInSellComputed ??=
              Computed<ObservableList<ArticleLine<ArticleAbstract>>>(
                  () => super.linesInSell,
                  name: 'ArticlesStoreBase.linesInSell'))
          .value;

  late final _$initialLoadingAtom =
      Atom(name: 'ArticlesStoreBase.initialLoading', context: context);

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

  late final _$_searchedByPrivateAtom =
      Atom(name: 'ArticlesStoreBase._searchedByPrivate', context: context);

  @override
  SearchedBy get _searchedByPrivate {
    _$_searchedByPrivateAtom.reportRead();
    return super._searchedByPrivate;
  }

  @override
  set _searchedByPrivate(SearchedBy value) {
    _$_searchedByPrivateAtom.reportWrite(value, super._searchedByPrivate, () {
      super._searchedByPrivate = value;
    });
  }

  late final _$_queryStringPrivateAtom =
      Atom(name: 'ArticlesStoreBase._queryStringPrivate', context: context);

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

  late final _$sortedByAtom =
      Atom(name: 'ArticlesStoreBase.sortedBy', context: context);

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

  late final _$linesAtom =
      Atom(name: 'ArticlesStoreBase.lines', context: context);

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

  late final _$_linesFilteredAtom =
      Atom(name: 'ArticlesStoreBase._linesFiltered', context: context);

  @override
  ObservableList<ArticleLine<ArticleAbstract>> get _linesFiltered {
    _$_linesFilteredAtom.reportRead();
    return super._linesFiltered;
  }

  @override
  set _linesFiltered(ObservableList<ArticleLine<ArticleAbstract>> value) {
    _$_linesFilteredAtom.reportWrite(value, super._linesFiltered, () {
      super._linesFiltered = value;
    });
  }

  late final _$articlesSelectedForBasketMinQtAtom = Atom(
      name: 'ArticlesStoreBase.articlesSelectedForBasketMinQt',
      context: context);

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

  late final _$initAsyncAction =
      AsyncAction('ArticlesStoreBase.init', context: context);

  @override
  Future<bool> init({List<ArticleLine<ArticleAbstract>>? data}) {
    return _$initAsyncAction.run(() => super.init(data: data));
  }

  late final _$clearSearchAsyncAction =
      AsyncAction('ArticlesStoreBase.clearSearch', context: context);

  @override
  Future<void> clearSearch() {
    return _$clearSearchAsyncAction.run(() => super.clearSearch());
  }

  late final _$addAllArticleLineAsyncAction =
      AsyncAction('ArticlesStoreBase.addAllArticleLine', context: context);

  @override
  Future<int> addAllArticleLine(
      List<ArticleLine<ArticleAbstract>> lineArticlesToSave) {
    return _$addAllArticleLineAsyncAction
        .run(() => super.addAllArticleLine(lineArticlesToSave));
  }

  late final _$upsertAllBasedOnIdAsyncAction =
      AsyncAction('ArticlesStoreBase.upsertAllBasedOnId', context: context);

  @override
  Future<int> upsertAllBasedOnId(
      List<ArticleLine<ArticleAbstract>> articlesInTheBush) {
    return _$upsertAllBasedOnIdAsyncAction
        .run(() => super.upsertAllBasedOnId(articlesInTheBush));
  }

  late final _$updateLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateLineArticle', context: context);

  @override
  Future<ArticleLine<A>> updateLineArticle<A extends ArticleAbstract>(
      ArticleLine<A> line) {
    return _$updateLineArticleAsyncAction
        .run(() => super.updateLineArticle<A>(line));
  }

  late final _$importCatalogueFromJsonAsyncAction = AsyncAction(
      'ArticlesStoreBase.importCatalogueFromJson',
      context: context);

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>> importCatalogueFromJson(
      String json) {
    return _$importCatalogueFromJsonAsyncAction
        .run(() => super.importCatalogueFromJson(json));
  }

  late final _$deleteAllArticlesAndLinesAsyncAction = AsyncAction(
      'ArticlesStoreBase.deleteAllArticlesAndLines',
      context: context);

  @override
  Future<bool> deleteAllArticlesAndLines() {
    return _$deleteAllArticlesAndLinesAsyncAction
        .run(() => super.deleteAllArticlesAndLines());
  }

  late final _$createLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createLineArticle', context: context);

  @override
  Future<ArticleLine<A>> createLineArticle<A extends ArticleAbstract>(
      ArticleLine<A> lineData) {
    return _$createLineArticleAsyncAction
        .run(() => super.createLineArticle<A>(lineData));
  }

  late final _$restoreLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.restoreLineArticle', context: context);

  @override
  Future<ArticleLine<ArticleAbstract>> restoreLineArticle(
      ArticleLine<ArticleAbstract> line) {
    return _$restoreLineArticleAsyncAction
        .run(() => super.restoreLineArticle(line));
  }

  late final _$deleteForeverLineArticleAsyncAction = AsyncAction(
      'ArticlesStoreBase.deleteForeverLineArticle',
      context: context);

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>> deleteForeverLineArticle(
      ArticleLine<ArticleAbstract> productData) {
    return _$deleteForeverLineArticleAsyncAction
        .run(() => super.deleteForeverLineArticle(productData));
  }

  late final _$deleteForeverArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverArticle', context: context);

  @override
  Future<ObservableList<ArticleLine<ArticleAbstract>>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) {
    return _$deleteForeverArticleAsyncAction
        .run(() => super.deleteForeverArticle<A>(articleData));
  }

  late final _$createArticleRetailAsyncAction =
      AsyncAction('ArticlesStoreBase.createArticleRetail', context: context);

  @override
  Future<A> createArticleRetail<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) {
    return _$createArticleRetailAsyncAction
        .run(() => super.createArticleRetail<A>(articleData, isTest: isTest));
  }

  late final _$updateArticleRetailAsyncAction =
      AsyncAction('ArticlesStoreBase.updateArticleRetail', context: context);

  @override
  Future<A> updateArticleRetail<A extends ArticleAbstract>(A articleData) {
    return _$updateArticleRetailAsyncAction
        .run(() => super.updateArticleRetail<A>(articleData));
  }

  late final _$ArticlesStoreBaseActionController =
      ActionController(name: 'ArticlesStoreBase', context: context);

  @override
  void setSearchedBy(SearchedBy val) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.setSearchedBy');
    try {
      return super.setSearchedBy(val);
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
  void searchPalpablesByTitleOrId() {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.searchPalpablesByTitleOrId');
    try {
      return super.searchPalpablesByTitleOrId();
    } finally {
      _$ArticlesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialLoading: ${initialLoading},
sortedBy: ${sortedBy},
lines: ${lines},
articlesSelectedForBasketMinQt: ${articlesSelectedForBasketMinQt},
linesPalpableFiltered: ${linesPalpableFiltered},
linesNotQuikspendNotBasket: ${linesNotQuikspendNotBasket},
articlesWeebiList: ${articlesWeebiList},
getSuggestions: ${getSuggestions},
getLinesNames: ${getLinesNames},
getArticlesFullNames: ${getArticlesFullNames},
linesInSell: ${linesInSell}
    ''';
  }
}
