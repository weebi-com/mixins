// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:collection/collection.dart';
import 'package:mixins_weebi/src/extensions/articles.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/extensions.dart';
import 'package:services_weebi/services_weebi.dart';

//import 'package:models_weebi/extensions.dart' show NextLineArticleId;

// Project imports:
import 'package:models_weebi/weebi_models.dart'
    show ArticleBasket, ArticleWMinQt, ArticleRetail, ArticleCalibre;

part 'articles.g.dart';

extension CoolExtension on ObservableList<ArticleCalibre> {
  ObservableList<ArticleCalibre> get notDeactivated =>
      ObservableList<ArticleCalibre>.of(where((p) => p.status));

  ObservableList<ArticleCalibre> get notQuickSpend =>
      ObservableList<ArticleCalibre>.of(where((p) => p.isNotQuickSpend));
}

class ResponseLight {
  final int code;
  final int countHandled;
  final int countIgnored;
  final List<ArticleCalibre> calibresIgnored;
  const ResponseLight(
      {required this.code,
      required this.calibresIgnored,
      required this.countHandled,
      required this.countIgnored});
}

enum SortedBy {
  unsorted,
  title,
  titleReversed,
  id,
  idReversed,
}

enum SearchedBy { titleOrId, barcode, none }

class ArticlesStore = ArticlesStoreBase with _$ArticlesStore;

abstract class ArticlesStoreBase<S extends ArticlesServiceAbstract> with Store {
  final S _articlesService;

  ArticlesStoreBase(this._articlesService) {
    initialLoading = true;
    calibres = ObservableList<ArticleCalibre>();
    _calibresFiltered = ObservableList<ArticleCalibre>();
    sortedBy = Observable(SortedBy.id);
    sortBy(SortedBy.id);
    articlesSelectedForBasketMinQt = ObservableList<ArticleWMinQt>();
  }

  @observable
  bool initialLoading = false;

  @observable
  SearchedBy _searchedByPrivate = SearchedBy.none;

  SearchedBy get searchedBy => _searchedByPrivate;

  @action
  void setSearchedBy(SearchedBy val) => _searchedByPrivate = val;

  @observable
  String _queryStringPrivate = '';

  String get queryString => _queryStringPrivate;

  @action
  void setQueryString(String val) {
    _queryStringPrivate = val;
  }

  @observable
  Observable<SortedBy> sortedBy = Observable(SortedBy.title);

  @observable
  ObservableList<ArticleCalibre> calibres =
      ObservableList.of(<ArticleCalibre>[]);

  @observable
  ObservableList<ArticleCalibre> _calibresFiltered =
      ObservableList.of(<ArticleCalibre>[]);

  @computed
  ObservableList<ArticleCalibre> get calibresPalpableFiltered =>
      _calibresFiltered;

  @computed
  ObservableList<ArticleCalibre> get calibresNotQuikspendNotBasket =>
      ObservableList<ArticleCalibre>.of(
          calibres.notQuickSpend.where((l) => l.isBasket == false));

  // used for creating and handling article basket
  @observable
  ObservableList<ArticleWMinQt> articlesSelectedForBasketMinQt =
      ObservableList<ArticleWMinQt>();

  @computed
  ObservableList<ArticleCalibre> get notDeactivated =>
      ObservableList<ArticleCalibre>.of(calibres.where((p) => p.status));

  @computed
  ObservableList<ArticleCalibre> get noQuickSpend =>
      ObservableList<ArticleCalibre>.of(
          calibres.where((p) => p.isNotQuickSpend));

  @action
  ArticleWMinQt findSingleArticleBasedOnFullName(String fullName) {
    if (articlesWeebiList.any((e) => e.fullName == fullName)) {
      if (articlesWeebiList.where((e) => e.fullName == fullName).length > 1) {
        print('too many matches');
      } else if (articlesSelectedForBasketMinQt
          .any((e) => e.fullName == fullName)) {
        print('already added');
      } else {
        // print(
        //     'found ${articlesWeebiList.firstWhereOrNull((e) => e.fullName == fullName).fullName}');
        final articleW =
            articlesWeebiList.firstWhereOrNull((e) => e.fullName == fullName);
        if (articleW != null) {
          final articleMinQt = ArticleWMinQt(1, // by default set-up to 1
              calibreId: articleW.calibreId,
              id: articleW.id,
              weight: articleW.weight,
              fullName: articleW.fullName,
              creationDate: articleW.creationDate,
              updateDate: articleW.updateDate);
          return articleMinQt;
        } else {
          throw 'articleW in weebilist is null';
        }
      }
    }
    return ArticleWMinQt.dummy;
  }

  @action
  void addArticleWInSelected(ArticleWMinQt articleMinQt) =>
      articlesSelectedForBasketMinQt.add(articleMinQt);

  @action
  void removeArticleMinQtInSelected(ArticleWMinQt article) {
    if (articlesSelectedForBasketMinQt
        .any((e) => e.calibreId == article.calibreId && e.id == article.id)) {
      articlesSelectedForBasketMinQt.remove(
          articlesSelectedForBasketMinQt.firstWhere(
              (e) => e.calibreId == article.calibreId && e.id == article.id));
    } else {
      print('no match');
    }
  }

  @action
  void updateArticleMinQtInSelected(ArticleWMinQt article, double minQt) {
    if (articlesSelectedForBasketMinQt
        .any((e) => e.calibreId == article.calibreId && e.id == article.id)) {
      final index = articlesSelectedForBasketMinQt.indexWhere(
          (e) => e.calibreId == article.calibreId && e.id == article.id);
      //print('minQt $minQt');
      articlesSelectedForBasketMinQt[index].minQt = minQt;
      //print('articlesWSelected[index].minQt ${articlesWSelected[index].minQt}');
      articlesSelectedForBasketMinQt =
          articlesSelectedForBasketMinQt; //trigger mobx
    } else {
      print('no match');
    }
  }

  @action
  void clearAllArticleMinQtInSelected() =>
      articlesSelectedForBasketMinQt = ObservableList<ArticleWMinQt>.of([]);

  @computed
  ObservableList<ArticleRetail> get articlesWeebiList {
    final articlesWeebiList = ObservableList<ArticleRetail>.of([]);
    final filtered = calibres
        .where((element) => element.isBasket == false)
        .where((element) => element.isPalpable == true);
    for (final calibre in filtered) {
      for (final article in calibre.articles) {
        articlesWeebiList.add(article as ArticleRetail);
      }
    }
    return articlesWeebiList;
  }

  @computed
  ObservableList<String> get getSuggestions {
    final strings = List<String>.of([]);
    for (final a in articlesWeebiList) {
      strings.add(a.fullName);
    }
    return ObservableList<String>.of(strings)
      ..retainWhere((s) => s
          .trim()
          .withoutAccents
          .toLowerCase()
          .contains(queryString.trim().withoutAccents.toLowerCase()));
  }

  @computed
  ObservableList<String> get getCalibresNames {
    final strings = List<String>.of([]);
    for (final calibre in calibres) {
      strings.add(calibre.title.trim().withoutAccents.toLowerCase());
    }
    return ObservableList<String>.of(strings);
  }

  @computed
  ObservableList<String> get getArticlesFullNames {
    final strings = List<String>.of([]);
    for (final line in calibres) {
      for (final article in line.articles) {
        strings.add(article.fullName.trim().withoutAccents.toLowerCase());
      }
    }
    return ObservableList<String>.of(strings);
  }

  ///

  @action
  ObservableList<ArticleCalibre> sortBy(SortedBy sortBy) {
    switch (sortBy) {
      case SortedBy.id:
        calibres = calibres.sortedById().notQuickSpend;
        sortedBy = Observable(SortedBy.id);
        break;
      case SortedBy.idReversed:
        calibres = calibres.sortedByIdReversed().notQuickSpend;
        sortedBy = Observable(SortedBy.idReversed);
        break;
      case SortedBy.title:
        calibres = calibres.sortedByTitle().notQuickSpend;
        sortedBy = Observable(SortedBy.title);
        break;
      case SortedBy.titleReversed:
        calibres = calibres.sortedByTitleReversed().notQuickSpend;
        sortedBy = Observable(SortedBy.titleReversed);
        break;
      default:
    }
    return calibres;
  }

  @action
  void searchPalpablesByTitleOrId() {
    if (calibres.isNotEmpty) {
      if (searchedBy == SearchedBy.titleOrId) {
        if (queryString.isNotEmpty) {
          _calibresFiltered =
              calibres.searchByTitleOrId(queryString).notQuickSpend;
        } else {
          _calibresFiltered = calibres.notQuickSpend;
        }
      }
    }
  }

  @computed
  ObservableList<ArticleCalibre> get calibresInSell => calibres.isEmpty
      ? ObservableList<ArticleCalibre>.of([])
      : searchedBy == SearchedBy.titleOrId && queryString.isNotEmpty
          ? ObservableList<ArticleCalibre>.of(calibres
              .searchByTitleOrId(queryString)
              .where((p) => p.status)
              .toList())
          : searchedBy == SearchedBy.barcode && queryString.isNotEmpty
              ? ObservableList<ArticleCalibre>.of(calibres
                  .where((p) => p.status)
                  .where((p) => p.isPalpable ?? true)
                  .where((p) => p.title != '*')
                  .where((p) =>
                      p.barcode.toString().trim() ==
                      queryString) // same queryString ?
                  .toList())
              : ObservableList<ArticleCalibre>.of(calibres
                  .where((p) => p.status)
                  .where((p) => p.isPalpable ?? true)
                  .where((p) => p.title != '*')
                  .toList());

  @action
  Future<bool> init({List<ArticleCalibre>? data}) async {
    if (data != null && data.isNotEmpty) {
      calibres = ObservableList.of(data);
      _calibresFiltered = data.palpables;
    } else {
      final calibresFromRpc =
          await _articlesService.getArticlesCalibresRpc.request(null);
      calibres = ObservableList.of(calibresFromRpc);
      _calibresFiltered = calibresFromRpc.palpables;
    }
    initialLoading = false;

    return initialLoading;
  }

  @action
  Future<void> clearSearch() async {
    setSearchedBy(SearchedBy.none);
    setQueryString('');
    // only way dart can clone a list
    _calibresFiltered = calibres
        .map((e) => ArticleCalibre(
            id: e.id,
            articles: e.articles,
            title: e.title,
            status: e.status,
            creationDate: e.creationDate,
            updateDate: e.updateDate))
        .palpables;
  }

  @action
  Future<int> addAllArticleCalibre(
      List<ArticleCalibre> lineArticlesToSave) async {
    await _articlesService.addAllArticleCalibreRpc.request(lineArticlesToSave);
    calibres.addAll(lineArticlesToSave);
    return lineArticlesToSave.length;
  }

  @action
  Future<int> upsertAllBasedOnId(List<ArticleCalibre> articlesInTheBush) async {
    final twoLists = calibres.findDupsById(newList: articlesInTheBush);
    if (twoLists.dups.isNotEmpty) {
      for (final a in twoLists.dups) {
        await updateLineArticle(a);
      }
    }
    if (twoLists.noDups.isNotEmpty) {
      await addAllArticleCalibre(twoLists.noDups);
    }
    return twoLists.dups.length + twoLists.noDups.length;
  }

  @action
  Future<ArticleCalibre<A>> updateLineArticle<A extends ArticleAbstract>(
      ArticleCalibre<A> line) async {
    final updatedLine =
        await _articlesService.updateArticleCalibreRpc.request(line);
    final index =
        calibres.indexWhere((element) => element.id == updatedLine.id);
    calibres.removeAt(index);
    calibres.add(updatedLine);

    return line;
  }

  @action
  Future<ObservableList<ArticleCalibre>> importCatalogueFromJson(
      String json) async {
    final lineArticles = (convert.json.decode(json) as List)
        .cast<Map>() // ?
        .cast<Map<String, dynamic>>()
        .map((line) => ArticleCalibre.fromMap(line))
        .toList();
    calibres = ObservableList.of(lineArticles);
    await _articlesService.addAllArticleCalibreRpc.request(calibres);
    return calibres;
  }

  // below is not different from above importCatalogue yet
  @action
  Future<bool> deleteAllArticlesAndCalibres() async {
    await _articlesService.deleteAllCalibresRpc.request([]);
    calibres.clear();
    return true;
  }

  @action
  Future<ArticleCalibre<A>> createCalibrateArticle<A extends ArticleAbstract>(
      ArticleCalibre<A> data) async {
    final lineArticle =
        await _articlesService.createLineArticleRpc.request(data);
    calibres.add(lineArticle);
    return data;
  }

  @action // not used at the moment
  Future<ArticleCalibre> restoreLineArticle(ArticleCalibre line) async {
    final restoredLine =
        await _articlesService.updateArticleCalibreRpc.request(line);
    final productIndex = restoredLine.id;
    calibres[productIndex] = restoredLine;
    return restoredLine;
  }

  @action
  Future<ObservableList<ArticleCalibre>> deleteForeverLineArticle(
      ArticleCalibre productData) async {
    // first remove it from any basket
    bool isBasketToBeDeleted = false;
    bool isBasketSingle = true;
    late ArticleCalibre<ArticleAbstract> lineToDelete;
    final listOfArticleBasketToDelete = [];

    // checking on all existing articles if one is in the proxy
    // if the article being deleted is in a basket then remove it
    if (productData.isBasket == false) {
      // TODO check and enforce that a basket cannot contain another basket
      for (final line in calibres.where((l) => (l.isBasket))) {
        for (final article in line.articles) {
          if ((article as ArticleBasket)
              .proxies
              .any((element) => element.proxyCalibreId == productData.id)) {
            if ((article).proxies.length > 1) {
              final index = (article).proxies.indexWhere(
                  (element) => element.proxyCalibreId == productData.id);
              (article).proxies.removeAt(index);
              await _articlesService.updateArticleRpc.request(article);
              final lineIndex = calibres.indexOf(line);
              final articleIndex =
                  calibres[lineIndex].articles.indexOf(article);
              calibres[lineIndex].articles[articleIndex] = article;
            } else {
              isBasketToBeDeleted = true;
              if (line.articles.length > 1) {
                isBasketSingle = false;
                listOfArticleBasketToDelete.add(article);
              } else {
                lineToDelete = line;
              }
            }
          }
        }
      }
      // out of the loop now
      // easy one basket only
      if (isBasketToBeDeleted) {
        if (isBasketSingle) {
          await _articlesService.deleteForeverLineRpc.request(lineToDelete);
          calibres.remove(lineToDelete);
        } else {
          // complexy many baskets concerned
          for (final a in listOfArticleBasketToDelete) {
            await _articlesService.deleteForeverArticleRpc.request(a);
            final lineIndex = calibres.indexWhere((l) => l.id == a.lineId);
            final articleIndex = calibres[lineIndex].articles.indexWhere(
                (article) =>
                    article.calibreId == a.lineId && article.id == a.id);
            calibres[lineIndex].articles.removeAt(articleIndex);
          }
        }
      }
    }
    await _articlesService.deleteForeverLineRpc.request(productData);
    final index =
        calibres.indexWhere((element) => element.id == productData.id);
    calibres.removeAt(index);
    return calibres;
  }

  @action
  Future<ObservableList<ArticleCalibre>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) async {
    // first remove it from any basket
    bool isBasketToBeDeleted = false;
    bool isBasketSingle = true;
    late ArticleCalibre<ArticleAbstract> lineToDelete;
    final listOfArticleBasketToDelete = [];
    for (final line in calibres.where((l) => (l.isBasket))) {
      for (final articleB in line.articles) {
        if ((articleB as ArticleBasket).proxies.any((proxy) =>
            proxy.proxyCalibreId == articleData.calibreId &&
            proxy.proxyArticleId == articleData.id)) {
          if (articleB.proxies.length > 1) {
            final proxyParam = articleB.proxies.firstWhereOrNull((proxy) =>
                proxy.proxyCalibreId == articleData.calibreId &&
                proxy.proxyArticleId == articleData.id);
            articleB.proxies.remove(proxyParam);
            final a = await _articlesService.updateArticleRpc.request(articleB);
            final lineIndex = calibres.indexOf(line);
            final articleIndex = calibres[lineIndex].articles.indexOf(a);
            calibres[lineIndex].articles[articleIndex] = a;
          } else {
            isBasketToBeDeleted = true;
            if (line.articles.length > 1) {
              isBasketSingle = false;
              listOfArticleBasketToDelete.add(articleB);
            } else {
              lineToDelete = line;
            }
          }
        }
      }
    }
    // out of the loop now
    // easy one basket only
    if (isBasketToBeDeleted) {
      if (isBasketSingle) {
        await _articlesService.deleteForeverLineRpc.request(lineToDelete);
        calibres.remove(lineToDelete);
      } else {
        // complexy many baskets concerned
        for (final a in listOfArticleBasketToDelete) {
          await _articlesService.deleteForeverArticleRpc.request(a);
          final lineIndex = calibres.indexWhere((l) => l.id == a.lineId);
          final articleIndex = calibres[lineIndex].articles.indexWhere(
              (article) => article.calibreId == a.lineId && article.id == a.id);
          calibres[lineIndex].articles.removeAt(articleIndex);
        }
      }
    }
    await _articlesService.deleteForeverArticleRpc.request(articleData);
    final lineArticle =
        calibres.firstWhereOrNull((p) => p.id == articleData.productId);
    if (lineArticle != null && lineArticle.articles.isNotEmpty) {
      final articleCool =
          lineArticle.articles.firstWhereOrNull((a) => a.id == articleData.id);
      lineArticle.articles.remove(articleCool);
    }
    return calibres;
  }

  @action
  Future<A> createArticleRetail<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) async {
    final createdArticle =
        await _articlesService.createArticleRpc.request(articleData);
    final lineArticle =
        calibres.firstWhereOrNull((line) => line.id == createdArticle.lineId);
    if (lineArticle != null && lineArticle.articles.isNotEmpty) {
      lineArticle.articles.add(createdArticle);
    }
    return createdArticle as A;
  }

  @action
  Future<A> updateArticleRetail<A extends ArticleAbstract>(
      A articleData) async {
    final updatedArticle =
        await _articlesService.updateArticleRpc.request(articleData);
    final lineArticle =
        calibres.firstWhereOrNull((e) => e.id == updatedArticle.calibreId);
    final lineArticleIndex = calibres.indexOf(lineArticle);

    if (lineArticle == null || lineArticle.articles.isEmpty) {
      throw 'error in updateArticle lineArticle == null or lineArticle.articlesIsEmpty';
    }
    final article =
        lineArticle.articles.firstWhereOrNull((a) => a.id == updatedArticle.id);
    if (article != null) {
      final articleIndex = lineArticle.articles.indexOf(article);
      calibres[lineArticleIndex].articles[articleIndex] = updatedArticle;

      // make sur that the function sparks an update in mobx => View
      final lineCool = calibres[lineArticleIndex];
      calibres.removeAt(lineArticleIndex);
      calibres.add(lineCool);
      return updatedArticle as A;
    } else {
      throw 'error in updateArticle';
    }
  }
}
