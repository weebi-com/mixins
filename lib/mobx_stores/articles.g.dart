// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticlesStore on ArticlesStoreBase, Store {
  Computed<ObservableList<LineOfArticles<ArticleAbstract>>>?
      _$linesPalpableNoBasketComputed;

  @override
  ObservableList<LineOfArticles<ArticleAbstract>> get linesPalpableNoBasket =>
      (_$linesPalpableNoBasketComputed ??=
              Computed<ObservableList<LineOfArticles<ArticleAbstract>>>(
                  () => super.linesPalpableNoBasket,
                  name: 'ArticlesStoreBase.linesPalpableNoBasket'))
          .value;
  Computed<ObservableList<Article>>? _$articlesWeebiListComputed;

  @override
  ObservableList<Article> get articlesWeebiList =>
      (_$articlesWeebiListComputed ??= Computed<ObservableList<Article>>(
              () => super.articlesWeebiList,
              name: 'ArticlesStoreBase.articlesWeebiList'))
          .value;
  Computed<ObservableList<String>>? _$getSuggestionsComputed;

  @override
  ObservableList<String> get getSuggestions => (_$getSuggestionsComputed ??=
          Computed<ObservableList<String>>(() => super.getSuggestions,
              name: 'ArticlesStoreBase.getSuggestions'))
      .value;
  Computed<ObservableList<LineOfArticles<ArticleAbstract>>>?
      _$linesInSellComputed;

  @override
  ObservableList<LineOfArticles<ArticleAbstract>> get linesInSell =>
      (_$linesInSellComputed ??=
              Computed<ObservableList<LineOfArticles<ArticleAbstract>>>(
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

  late final _$_isFilterPrivateAtom =
      Atom(name: 'ArticlesStoreBase._isFilterPrivate', context: context);

  @override
  bool get _isFilterPrivate {
    _$_isFilterPrivateAtom.reportRead();
    return super._isFilterPrivate;
  }

  @override
  set _isFilterPrivate(bool value) {
    _$_isFilterPrivateAtom.reportWrite(value, super._isFilterPrivate, () {
      super._isFilterPrivate = value;
    });
  }

  late final _$_filteredByPrivateAtom =
      Atom(name: 'ArticlesStoreBase._filteredByPrivate', context: context);

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

  late final _$linesAtom =
      Atom(name: 'ArticlesStoreBase.lines', context: context);

  @override
  ObservableList<LineOfArticles<ArticleAbstract>> get lines {
    _$linesAtom.reportRead();
    return super.lines;
  }

  @override
  set lines(ObservableList<LineOfArticles<ArticleAbstract>> value) {
    _$linesAtom.reportWrite(value, super.lines, () {
      super.lines = value;
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
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addAllLinesAsyncAction =
      AsyncAction('ArticlesStoreBase.addAllLines', context: context);

  @override
  Future<int> addAllArticleLines(
      List<LineOfArticles<ArticleAbstract>> _lineArticlesToSave) {
    return _$addAllLinesAsyncAction
        .run(() => super.addAllArticleLines(_lineArticlesToSave));
  }

  late final _$updateAllLinesThatMatchAsyncAction = AsyncAction(
      'ArticlesStoreBase.updateAllLinesThatMatch',
      context: context);

  @override
  Future<int> updateAllLinesThatMatch(
      List<LineOfArticles<ArticleAbstract>> _lineArticlesToUpdate) {
    return _$updateAllLinesThatMatchAsyncAction
        .run(() => super.updateAllLinesThatMatch(_lineArticlesToUpdate));
  }

  late final _$updateLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateLineArticle', context: context);

  @override
  Future<LineOfArticles<ArticleAbstract>> updateLineArticle(
      LineOfArticles<ArticleAbstract> line) {
    return _$updateLineArticleAsyncAction
        .run(() => super.updateLineArticle(line));
  }

  late final _$importCatalogueFromJsonAsyncAction = AsyncAction(
      'ArticlesStoreBase.importCatalogueFromJson',
      context: context);

  @override
  Future<ObservableList<LineOfArticles<ArticleAbstract>>>
      importCatalogueFromJson(String json) {
    return _$importCatalogueFromJsonAsyncAction
        .run(() => super.importCatalogueFromJson(json));
  }

  late final _$deleteAllArticlesAndLinesAsyncAction = AsyncAction(
      'ArticlesStoreBase.deleteAllArticlesAndLines',
      context: context);

  @override
  Future<void> deleteAllArticlesAndLines() {
    return _$deleteAllArticlesAndLinesAsyncAction
        .run(() => super.deleteAllArticlesAndLines());
  }

  late final _$createLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createLineArticle', context: context);

  @override
  Future<LineOfArticles<ArticleAbstract>>
      createLineArticle<A extends ArticleAbstract>(LineOfArticles<A> lineData) {
    return _$createLineArticleAsyncAction
        .run(() => super.createLineArticle<A>(lineData));
  }

  late final _$stockLowWarningAsyncAction =
      AsyncAction('ArticlesStoreBase.stockLowWarning', context: context);

  @override
  Future<LineOfArticles<ArticleAbstract>> stockLowWarning(
      LineOfArticles<ArticleAbstract> productFalse) {
    return _$stockLowWarningAsyncAction
        .run(() => super.stockLowWarning(productFalse));
  }

  late final _$restoreLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.restoreLineArticle', context: context);

  @override
  Future<LineOfArticles<ArticleAbstract>> restoreLineArticle(
      LineOfArticles<ArticleAbstract> _line) {
    return _$restoreLineArticleAsyncAction
        .run(() => super.restoreLineArticle(_line));
  }

  late final _$deleteForeverLineArticleAsyncAction = AsyncAction(
      'ArticlesStoreBase.deleteForeverLineArticle',
      context: context);

  @override
  Future<ObservableList<LineOfArticles<ArticleAbstract>>>
      deleteForeverLineArticle(LineOfArticles<ArticleAbstract> productData) {
    return _$deleteForeverLineArticleAsyncAction
        .run(() => super.deleteForeverLineArticle(productData));
  }

  late final _$deleteForeverArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverArticle', context: context);

  @override
  Future<ObservableList<LineOfArticles<ArticleAbstract>>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) {
    return _$deleteForeverArticleAsyncAction
        .run(() => super.deleteForeverArticle<A>(articleData));
  }

  late final _$createArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.createArticle', context: context);

  @override
  Future<A> createArticle<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) {
    return _$createArticleAsyncAction
        .run(() => super.createArticle<A>(articleData, isTest: isTest));
  }

  late final _$updateArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateArticle', context: context);

  @override
  Future<A> updateArticle<A extends ArticleAbstract>(A articleData) {
    return _$updateArticleAsyncAction
        .run(() => super.updateArticle<A>(articleData));
  }

  late final _$ArticlesStoreBaseActionController =
      ActionController(name: 'ArticlesStoreBase', context: context);

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
  ObservableList<LineOfArticles<ArticleAbstract>> sortBy(SortedBy sortBy) {
    final _$actionInfo = _$ArticlesStoreBaseActionController.startAction(
        name: 'ArticlesStoreBase.sortBy');
    try {
      return super.sortBy(sortBy);
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
linesPalpableNoBasket: ${linesPalpableNoBasket},
articlesWeebiList: ${articlesWeebiList},
getSuggestions: ${getSuggestions},
linesInSell: ${linesInSell}
    ''';
  }
}
