// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticlesStore<S extends ArticlesServiceAbstract>
    on ArticlesStoreBase<S>, Store {
  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>?
      _$calibresPalpableFilteredComputed;

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>>
      get calibresPalpableFiltered => (_$calibresPalpableFilteredComputed ??=
              Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>(
                  () => super.calibresPalpableFiltered,
                  name: 'ArticlesStoreBase.calibresPalpableFiltered'))
          .value;
  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>?
      _$calibresNotQuikspendNotBasketComputed;

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>>
      get calibresNotQuikspendNotBasket =>
          (_$calibresNotQuikspendNotBasketComputed ??=
                  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>(
                      () => super.calibresNotQuikspendNotBasket,
                      name: 'ArticlesStoreBase.calibresNotQuikspendNotBasket'))
              .value;
  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>?
      _$notDeactivatedComputed;

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>> get notDeactivated =>
      (_$notDeactivatedComputed ??=
              Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>(
                  () => super.notDeactivated,
                  name: 'ArticlesStoreBase.notDeactivated'))
          .value;
  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>?
      _$noQuickSpendComputed;

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>> get noQuickSpend =>
      (_$noQuickSpendComputed ??=
              Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>(
                  () => super.noQuickSpend,
                  name: 'ArticlesStoreBase.noQuickSpend'))
          .value;
  Computed<ObservableList<ArticleRetail>>? _$articlesRetailListComputed;

  @override
  ObservableList<ArticleRetail> get articlesRetailList =>
      (_$articlesRetailListComputed ??= Computed<ObservableList<ArticleRetail>>(
              () => super.articlesRetailList,
              name: 'ArticlesStoreBase.articlesRetailList'))
          .value;
  Computed<ObservableList<String>>? _$getSuggestionsComputed;

  @override
  ObservableList<String> get getSuggestions => (_$getSuggestionsComputed ??=
          Computed<ObservableList<String>>(() => super.getSuggestions,
              name: 'ArticlesStoreBase.getSuggestions'))
      .value;
  Computed<ObservableList<String>>? _$getCalibresNamesComputed;

  @override
  ObservableList<String> get getCalibresNames => (_$getCalibresNamesComputed ??=
          Computed<ObservableList<String>>(() => super.getCalibresNames,
              name: 'ArticlesStoreBase.getCalibresNames'))
      .value;
  Computed<ObservableList<String>>? _$getArticlesFullNamesComputed;

  @override
  ObservableList<String> get getArticlesFullNames =>
      (_$getArticlesFullNamesComputed ??= Computed<ObservableList<String>>(
              () => super.getArticlesFullNames,
              name: 'ArticlesStoreBase.getArticlesFullNames'))
          .value;
  Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>?
      _$calibresInSellComputed;

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>> get calibresInSell =>
      (_$calibresInSellComputed ??=
              Computed<ObservableList<ArticleCalibre<ArticleAbstract>>>(
                  () => super.calibresInSell,
                  name: 'ArticlesStoreBase.calibresInSell'))
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

  late final _$calibresAtom =
      Atom(name: 'ArticlesStoreBase.calibres', context: context);

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>> get calibres {
    _$calibresAtom.reportRead();
    return super.calibres;
  }

  @override
  set calibres(ObservableList<ArticleCalibre<ArticleAbstract>> value) {
    _$calibresAtom.reportWrite(value, super.calibres, () {
      super.calibres = value;
    });
  }

  late final _$photosAtom =
      Atom(name: 'ArticlesStoreBase.photos', context: context);

  @override
  ObservableList<ArticlePhoto> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<ArticlePhoto> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$_calibresFilteredAtom =
      Atom(name: 'ArticlesStoreBase._calibresFiltered', context: context);

  @override
  ObservableList<ArticleCalibre<ArticleAbstract>> get _calibresFiltered {
    _$_calibresFilteredAtom.reportRead();
    return super._calibresFiltered;
  }

  @override
  set _calibresFiltered(ObservableList<ArticleCalibre<ArticleAbstract>> value) {
    _$_calibresFilteredAtom.reportWrite(value, super._calibresFiltered, () {
      super._calibresFiltered = value;
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
  Future<bool> init(
      {List<ArticleCalibre<ArticleAbstract>>? data,
      List<ArticlePhoto>? photosData}) {
    return _$initAsyncAction
        .run(() => super.init(data: data, photosData: photosData));
  }

  late final _$clearSearchAsyncAction =
      AsyncAction('ArticlesStoreBase.clearSearch', context: context);

  @override
  Future<void> clearSearch() {
    return _$clearSearchAsyncAction.run(() => super.clearSearch());
  }

  late final _$createAllArticleCalibreAsyncAction = AsyncAction(
      'ArticlesStoreBase.createAllArticleCalibre',
      context: context);

  @override
  Future<int> createAllArticleCalibre(
      List<ArticleCalibre<ArticleAbstract>> lineArticlesToSave) {
    return _$createAllArticleCalibreAsyncAction
        .run(() => super.createAllArticleCalibre(lineArticlesToSave));
  }

  late final _$upsertAllBasedOnIdAsyncAction =
      AsyncAction('ArticlesStoreBase.upsertAllBasedOnId', context: context);

  @override
  Future<int> upsertAllBasedOnId(
      List<ArticleCalibre<ArticleAbstract>> articlesInTheBush) {
    return _$upsertAllBasedOnIdAsyncAction
        .run(() => super.upsertAllBasedOnId(articlesInTheBush));
  }

  late final _$updateLineArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.updateLineArticle', context: context);

  @override
  Future<ArticleCalibre<A>> updateLineArticle<A extends ArticleAbstract>(
      ArticleCalibre<A> line) {
    return _$updateLineArticleAsyncAction
        .run(() => super.updateLineArticle<A>(line));
  }

  late final _$importCatalogueFromJsonAsyncAction = AsyncAction(
      'ArticlesStoreBase.importCatalogueFromJson',
      context: context);

  @override
  Future<ObservableList<ArticleCalibre<ArticleAbstract>>>
      importCatalogueFromJson(String json) {
    return _$importCatalogueFromJsonAsyncAction
        .run(() => super.importCatalogueFromJson(json));
  }

  late final _$deleteAllArticlesAndPhotosAndCalibresAsyncAction = AsyncAction(
      'ArticlesStoreBase.deleteAllArticlesAndPhotosAndCalibres',
      context: context);

  @override
  Future<bool> deleteAllArticlesAndPhotosAndCalibres() {
    return _$deleteAllArticlesAndPhotosAndCalibresAsyncAction
        .run(() => super.deleteAllArticlesAndPhotosAndCalibres());
  }

  late final _$createAndCalibrateArticleAsyncAction = AsyncAction(
      'ArticlesStoreBase.createAndCalibrateArticle',
      context: context);

  @override
  Future<ArticleCalibre<A>>
      createAndCalibrateArticle<A extends ArticleAbstract>(
          ArticleCalibre<A> data) {
    return _$createAndCalibrateArticleAsyncAction
        .run(() => super.createAndCalibrateArticle<A>(data));
  }

  late final _$createPhotoAsyncAction =
      AsyncAction('ArticlesStoreBase.createPhoto', context: context);

  @override
  Future<ArticlePhoto> createPhoto(ArticlePhoto data) {
    return _$createPhotoAsyncAction.run(() => super.createPhoto(data));
  }

  late final _$deletePhotoAsyncAction =
      AsyncAction('ArticlesStoreBase.deletePhoto', context: context);

  @override
  Future<bool> deletePhoto(ArticlePhoto data) {
    return _$deletePhotoAsyncAction.run(() => super.deletePhoto(data));
  }

  late final _$restoreCalibreAsyncAction =
      AsyncAction('ArticlesStoreBase.restoreCalibre', context: context);

  @override
  Future<ArticleCalibre<ArticleAbstract>> restoreCalibre(
      ArticleCalibre<ArticleAbstract> line) {
    return _$restoreCalibreAsyncAction.run(() => super.restoreCalibre(line));
  }

  late final _$deleteForeverCalibreAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverCalibre', context: context);

  @override
  Future<ObservableList<ArticleCalibre<ArticleAbstract>>> deleteForeverCalibre(
      ArticleCalibre<ArticleAbstract> calibreData) {
    return _$deleteForeverCalibreAsyncAction
        .run(() => super.deleteForeverCalibre(calibreData));
  }

  late final _$deleteForeverArticleAsyncAction =
      AsyncAction('ArticlesStoreBase.deleteForeverArticle', context: context);

  @override
  Future<ObservableList<ArticleCalibre<ArticleAbstract>>>
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
  ObservableList<ArticleCalibre<ArticleAbstract>> sortBy(SortedBy sortBy) {
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
calibres: ${calibres},
photos: ${photos},
articlesSelectedForBasketMinQt: ${articlesSelectedForBasketMinQt},
calibresPalpableFiltered: ${calibresPalpableFiltered},
calibresNotQuikspendNotBasket: ${calibresNotQuikspendNotBasket},
notDeactivated: ${notDeactivated},
noQuickSpend: ${noQuickSpend},
articlesRetailList: ${articlesRetailList},
getSuggestions: ${getSuggestions},
getCalibresNames: ${getCalibresNames},
getArticlesFullNames: ${getArticlesFullNames},
calibresInSell: ${calibresInSell}
    ''';
  }
}
