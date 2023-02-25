// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:collection/collection.dart';
import 'package:mixins_weebi/extensions/articles.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/extensions.dart';
import 'package:services_weebi/services_weebi.dart';

//import 'package:models_weebi/extensions.dart' show NextLineArticleId;

// Project imports:
import 'package:models_weebi/weebi_models.dart'
    show ArticleBasket, ArticleWMinQt, Article, LineOfArticles;

part 'articles.g.dart';

enum SortedBy {
  unsorted,
  title,
  titleReversed,
  id,
  idReversed,
}

enum FilteredBy { title, barcode, none }

class ArticlesStore = ArticlesStoreBase with _$ArticlesStore;

abstract class ArticlesStoreBase<S extends ArticlesServiceAbstract> with Store {
  final S _articlesService;

  ArticlesStoreBase(this._articlesService) {
    initialLoading = true;
    lines = ObservableList<LineOfArticles>();
    linesPalpableFiltered = ObservableList<LineOfArticles>();
    sortBy(SortedBy.title);
    sortedBy = Observable(SortedBy.title);
    articlesSelectedForBasketMinQt = ObservableList<ArticleWMinQt>();
  }

  @observable
  bool initialLoading = false;

  @observable
  bool isSearch = false;

  @observable
  FilteredBy _filteredByPrivate = FilteredBy.none;

  FilteredBy get filteredBy => _filteredByPrivate;

  @action
  void setFilteredBy(FilteredBy val) => _filteredByPrivate = val;

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
  ObservableList<LineOfArticles> lines = ObservableList.of(<LineOfArticles>[]);

  @observable
  ObservableList<LineOfArticles> linesPalpableFiltered =
      ObservableList.of(<LineOfArticles>[]);

  @computed
  ObservableList<LineOfArticles> get linesPalpableNoBasket =>
      ObservableList<LineOfArticles>.of(
          lines.isPalpable.where((l) => l.isBasket == false));

  // used for creating and handling article basket
  @observable
  ObservableList<ArticleWMinQt> articlesSelectedForBasketMinQt =
      ObservableList<ArticleWMinQt>();
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
              lineId: articleW.lineId,
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
        .any((e) => e.lineId == article.lineId && e.id == article.id)) {
      articlesSelectedForBasketMinQt.remove(articlesSelectedForBasketMinQt
          .firstWhere((e) => e.lineId == article.lineId && e.id == article.id));
    } else {
      print('no match');
    }
  }

  @action
  void updateArticleMinQtInSelected(ArticleWMinQt article, double minQt) {
    if (articlesSelectedForBasketMinQt
        .any((e) => e.lineId == article.lineId && e.id == article.id)) {
      final index = articlesSelectedForBasketMinQt
          .indexWhere((e) => e.lineId == article.lineId && e.id == article.id);
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
  ObservableList<Article> get articlesWeebiList {
    final articlesWeebiList = ObservableList<Article>.of([]);
    final filtered = lines
        .where((element) => element.isBasket == false)
        .where((element) => element.isPalpable == true);
    for (final line in filtered) {
      for (final article in line.articles) {
        articlesWeebiList.add(article as Article);
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

  ///

  @action
  ObservableList<LineOfArticles> sortBy(SortedBy sortBy) {
    switch (sortBy) {
      case SortedBy.id:
        linesPalpableFiltered = lines.sortedById().isPalpable;
        sortedBy = Observable(SortedBy.id);
        break;
      case SortedBy.idReversed:
        linesPalpableFiltered = lines.sortedByIdReversed().isPalpable;
        sortedBy = Observable(SortedBy.idReversed);
        break;
      case SortedBy.title:
        linesPalpableFiltered = lines.sortedByTitle().isPalpable;
        sortedBy = Observable(SortedBy.title);
        break;
      case SortedBy.titleReversed:
        linesPalpableFiltered = lines.sortedByTitleReversed().isPalpable;
        sortedBy = Observable(SortedBy.titleReversed);
        break;
      default:
    }
    return lines;
  }

  @action
  void filterByTitle() {
    if (lines.isNotEmpty) {
      if (filteredBy == FilteredBy.title) {
        if (queryString.isNotEmpty) {
          linesPalpableFiltered = lines.filterByTitle(queryString).isPalpable;
        } else {
          linesPalpableFiltered = lines.isPalpable;
        }
      }
    }
  }

  @computed
  ObservableList<LineOfArticles> get linesInSell => lines.isEmpty
      ? ObservableList<LineOfArticles>.of([])
      : filteredBy == FilteredBy.title && queryString.isNotEmpty
          ? ObservableList<LineOfArticles>.of(
              lines.filterByTitle(queryString).where((p) => p.status).toList())
          : filteredBy == FilteredBy.barcode && queryString.isNotEmpty
              ? ObservableList<LineOfArticles>.of(lines
                  .where((p) => p.status)
                  .where((p) => p.isPalpable ?? true)
                  .where((p) => p.title != '*')
                  .where((p) =>
                      p.barcode.toString().trim() ==
                      queryString) // same queryString ?
                  .toList())
              : ObservableList<LineOfArticles>.of(lines
                  .where((p) => p.status)
                  .where((p) => p.isPalpable ?? true)
                  .where((p) => p.title != '*')
                  .toList());

  @action
  Future<bool> init({List<LineOfArticles>? data}) async {
    if (data != null && data.isNotEmpty) {
      lines = ObservableList.of(data);
      linesPalpableFiltered = data.isPalpable;
    } else {
      final linesFromRpc =
          await _articlesService.getArticlesLinesRpc.request(null);
      lines = ObservableList.of(linesFromRpc);
      linesPalpableFiltered = linesFromRpc.isPalpable;
    }
    initialLoading = false;

    return initialLoading;
  }

  @action
  Future<void> clearFilter({List<LineOfArticles>? data}) async {
    setFilteredBy(FilteredBy.none);
    setQueryString('');
    // only way dart can clone a list
    linesPalpableFiltered = lines
        .map((e) => LineOfArticles(
            id: e.id,
            articles: e.articles,
            title: e.title,
            status: e.status,
            creationDate: e.creationDate,
            updateDate: e.updateDate))
        .isPalpable;
  }

  @action
  Future<int> addAllArticleLines(
      List<LineOfArticles> lineArticlesToSave) async {
    //TODO get a count to check this ok
    await _articlesService.addAllArticleLinesRpc.request(lineArticlesToSave);
    lines.addAll(lineArticlesToSave);
    return lineArticlesToSave.length;
  }

  @action
  Future<int> updateAllLinesThatMatch(
      List<LineOfArticles> lineArticlesToUpdate) async {
    final listToUpdate = <LineOfArticles>[];
    // print(lineArticlesToUpdate.length);
    for (var i = 0; i < lineArticlesToUpdate.length; i++) {
      if (lines.any((e) => e.title == lineArticlesToUpdate[i].title)) {
        final match =
            lines.where((e) => e.title == lineArticlesToUpdate[i].title);
        // print('match.length ${match.length}');
        if (match.length > 1) {
          //print(
          //    'dups found x${match.length} times : e.${lineArticlesToUpdate[i].toString()}');
          throw 'x${match.length} articles ont le titre ${lines[i].title}, veuillez les renommer pour éviter les erreurs d\'import';
        } else {
          // print('try copy');
          final tempToupdate = match.first.copyWith(articles: [
            (match.first.articles.first as Article).copyWith(
              price: (lineArticlesToUpdate[i].articles.first as Article).price,
              cost: (lineArticlesToUpdate[i].articles.first as Article).cost,
              articleCode: lineArticlesToUpdate[i]
                  .articles
                  .first
                  .articleCode, //TODO ask Sidy if this is better than title
            )
          ]);
          print('try add');
          listToUpdate.add(tempToupdate);
        }
      } else {
        print('no match in any');
      }
    }
    if (listToUpdate.isNotEmpty) {
      for (final l in listToUpdate) {
        // print('try update ${l.toMap()}');
        await updateLineArticle(l);
      }
    } else {
      print('no match');
    }
    return listToUpdate.length;
  }

  @action
  Future<LineOfArticles> updateLineArticle(LineOfArticles line) async {
    final updatedLine =
        await _articlesService.updateArticleLineRpc.request(line);
    final index = lines.indexWhere((element) => element.id == updatedLine.id);
    lines.removeAt(index);
    lines.add(updatedLine);
    return updatedLine;
  }

  @action
  Future<ObservableList<LineOfArticles>> importCatalogueFromJson(
      String json) async {
    final lineArticles = (convert.json.decode(json) as List)
        .cast<Map>() // ?
        .cast<Map<String, dynamic>>()
        .map((line) => LineOfArticles.fromMap(line))
        .toList();
    lines = ObservableList.of(lineArticles);
    await _articlesService.addAllArticleLinesRpc.request(lines);
    return lines;
  }

  // below is not different from above importCatalogue yet
  @action
  Future<void> deleteAllArticlesAndLines() async {
    await _articlesService.deleteAllLinesRpc.request([]);
    lines.clear();
    return;
  }

  @action
  Future<LineOfArticles> createLineArticle<A extends ArticleAbstract>(
      LineOfArticles<A> lineData) async {
    final lineArticle =
        await _articlesService.createLineArticleRpc.request(lineData);
    lines.add(lineData);
    return lineData is LineOfArticles<Article>
        ? lineData as LineOfArticles<Article>
        : lineData as LineOfArticles<ArticleBasket>;
  }

// rename this to fit the use case of warning that product is out of stock
  @action
  Future<LineOfArticles> stockLowWarning(LineOfArticles productFalse) async {
    final stockLowProduct =
        await _articlesService.updateArticleLineRpc.request(productFalse);
    var productIndex = stockLowProduct.id;
    lines[productIndex] = stockLowProduct;
    return stockLowProduct;
  }

  @action // not used at the moment
  Future<LineOfArticles> restoreLineArticle(LineOfArticles line) async {
    final restoredLine =
        await _articlesService.updateArticleLineRpc.request(line);
    final productIndex = restoredLine.id;
    lines[productIndex] = restoredLine;
    return restoredLine;
  }

  @action
  Future<ObservableList<LineOfArticles>> deleteForeverLineArticle(
      LineOfArticles productData) async {
    // first remove it from any basket
    bool isBasketToBeDeleted = false;
    bool isBasketSingle = true;
    late LineOfArticles<ArticleAbstract> lineToDelete;
    final listOfArticleBasketToDelete = [];

    for (final line in lines.where((l) => (l.isBasket ?? false))) {
      for (final article in line.articles) {
        if ((article as ArticleBasket)
            .proxies
            .any((element) => element.proxyLineId == productData.id)) {
          if (article.proxies.length > 1) {
            final index = article.proxies
                .indexWhere((element) => element.proxyLineId == productData.id);
            article.proxies.removeAt(index);
            await _articlesService.updateArticleRpc.request(article);
            final lineIndex = lines.indexOf(line);
            final articleIndex = lines[lineIndex].articles.indexOf(article);
            lines[lineIndex].articles[articleIndex] = article;
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
        lines.remove(lineToDelete);
      } else {
        // complexy many baskets concerned
        for (final a in listOfArticleBasketToDelete) {
          await _articlesService.deleteForeverArticleRpc.request(a);
          final lineIndex = lines.indexWhere((l) => l.id == a.lineId);
          final articleIndex = lines[lineIndex].articles.indexWhere(
              (article) => article.lineId == a.lineId && article.id == a.id);
          lines[lineIndex].articles.removeAt(articleIndex);
        }
      }
    }
    await _articlesService.deleteForeverLineRpc.request(productData);
    final index = lines.indexWhere((element) => element.id == productData.id);
    lines.removeAt(index);
    return lines;
  }

  @action
  Future<ObservableList<LineOfArticles>>
      deleteForeverArticle<A extends ArticleAbstract>(A articleData) async {
    // first remove it from any basket
    bool isBasketToBeDeleted = false;
    bool isBasketSingle = true;
    late LineOfArticles<ArticleAbstract> lineToDelete;
    final listOfArticleBasketToDelete = [];
    for (final line in lines.where((l) => (l.isBasket ?? false))) {
      for (final articleB in line.articles) {
        if ((articleB as ArticleBasket).proxies.any((proxy) =>
            proxy.proxyLineId == articleData.lineId &&
            proxy.proxyArticleId == articleData.id)) {
          if (articleB.proxies.length > 1) {
            final proxyParam = articleB.proxies.firstWhereOrNull((proxy) =>
                proxy.proxyLineId == articleData.lineId &&
                proxy.proxyArticleId == articleData.id);
            articleB.proxies.remove(proxyParam);
            final a = await _articlesService.updateArticleRpc.request(articleB);
            final lineIndex = lines.indexOf(line);
            final articleIndex = lines[lineIndex].articles.indexOf(a);
            lines[lineIndex].articles[articleIndex] = a;
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
        lines.remove(lineToDelete);
      } else {
        // complexy many baskets concerned
        for (final a in listOfArticleBasketToDelete) {
          await _articlesService.deleteForeverArticleRpc.request(a);
          final lineIndex = lines.indexWhere((l) => l.id == a.lineId);
          final articleIndex = lines[lineIndex].articles.indexWhere(
              (article) => article.lineId == a.lineId && article.id == a.id);
          lines[lineIndex].articles.removeAt(articleIndex);
        }
      }
    }
    await _articlesService.deleteForeverArticleRpc.request(articleData);
    final lineArticle =
        lines.firstWhereOrNull((p) => p.id == articleData.productId);
    final articleCool =
        lineArticle!.articles.firstWhereOrNull((a) => a.id == articleData.id);
    lineArticle.articles.remove(articleCool);
    return lines;
  }

  @action
  Future<A> createArticle<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) async {
    final createdArticle =
        await _articlesService.createArticleRpc.request(articleData);
    final lineArticle =
        lines.firstWhereOrNull((line) => line.id == createdArticle.lineId);
    lineArticle!.articles.add(createdArticle);
    return createdArticle as A;
  }

  @action
  Future<A> updateArticle<A extends ArticleAbstract>(A articleData) async {
    final updatedArticle =
        await _articlesService.updateArticleRpc.request(articleData);
    final lineArticle = lines
        .firstWhereOrNull((product) => product.id == updatedArticle.productId);
    final lineArticleIndex = lines.indexOf(lineArticle);
    final article = lineArticle!.articles
        .firstWhereOrNull((a) => a.id == updatedArticle.id);
    if (article != null) {
      final articleIndex = lineArticle.articles.indexOf(article);
      lines[lineArticleIndex].articles[articleIndex] = updatedArticle;

      // make sur that the function sparks an update in mobx => View
      final lineCool = lines[lineArticleIndex];
      lines.removeAt(lineArticleIndex);
      lines.add(lineCool);
      return updatedArticle as A;
    } else {
      throw 'error in updateArticle';
    }
  }
}
