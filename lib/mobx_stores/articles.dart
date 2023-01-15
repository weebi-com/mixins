// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:collection/collection.dart';
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

enum FilteredBy { title, barcode }

class ArticlesStore = ArticlesStoreBase with _$ArticlesStore;

abstract class ArticlesStoreBase with Store {
  final ArticlesService _articlesService;

  ArticlesStoreBase(this._articlesService) {
    initialLoading = true;
    _isFilterPrivate = false;
    lines = ObservableList<LineOfArticles>();
    sortBy(SortedBy.title);
    sortedBy = SortedBy.title;
    articlesSelectedForBasketMinQt = ObservableList<ArticleWMinQt>();
  }

  @observable
  bool initialLoading = false;

  @observable
  bool _isFilterPrivate = false;

  bool get isFilter => _isFilterPrivate;

  @action
  void setIsFilter(bool val) => _isFilterPrivate = val;

  @observable
  FilteredBy _filteredByPrivate = FilteredBy.title;

  FilteredBy get filteredBy => _filteredByPrivate;

  @action
  void setFilteredBy(FilteredBy val) => _filteredByPrivate = val;

  @observable
  String _queryStringPrivate = '';

  String get queryString => _queryStringPrivate;

  @action
  void setQueryString(String val) => _queryStringPrivate = val;

  @observable
  SortedBy sortedBy = SortedBy.title;

  @observable
  ObservableList<LineOfArticles> lines = ObservableList.of(<LineOfArticles>[]);

  @computed
  ObservableList<LineOfArticles> get linesPalpableNoBasket =>
      ObservableList<LineOfArticles>.of(
          lines.where((l) => (l.isPalpable ?? true) && l.isBasket == false));

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
        lines = lines.sortedById();
        sortedBy = SortedBy.id;
        break;
      case SortedBy.idReversed:
        lines = lines.sortedByIdReversed();
        sortedBy = SortedBy.idReversed;
        break;
      case SortedBy.title:
        lines = lines.sortedByTitle();
        sortedBy = SortedBy.title;
        break;
      case SortedBy.titleReversed:
        lines = lines.sortedByTitleReversed();
        sortedBy = SortedBy.titleReversed;
        break;
      default:
    }
    return lines;
  }

  @computed
  ObservableList<LineOfArticles> get linesInSell => lines.isEmpty
      ? ObservableList<LineOfArticles>.of([])
      : isFilter && filteredBy == FilteredBy.title && queryString.isNotEmpty
          ? ObservableList<LineOfArticles>.of(lines
              .where((p) => p.status)
              .where((p) => p.isPalpable ?? true)
              .where((p) => p.title != '*')
              .where((p) => p.title
                  .toLowerCase()
                  .withoutAccents
                  .contains(queryString.withoutAccents.toLowerCase()))
              .toList())
          : isFilter &&
                  filteredBy == FilteredBy.barcode &&
                  queryString.isNotEmpty
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
  Future<void> init() async {
    final linesFromRpc = await _articlesService.getLinesRpc.request(null);
    lines = ObservableList.of(linesFromRpc);
    initialLoading = false;
  }

  @action
  Future<int> addAllLines(List<LineOfArticles> lineArticlesToSave) async {
    await _articlesService.addAllLinesRpc.request(lineArticlesToSave);
    lines.addAll(lineArticlesToSave);
    return lineArticlesToSave.length;
  }

  @action
  Future<int> updateAllLinesThatMatch(
      List<LineOfArticles> _lineArticlesToUpdate) async {
    final listToUpdate = <LineOfArticles>[];
    // print(_lineArticlesToUpdate.length);
    for (var i = 0; i < _lineArticlesToUpdate.length; i++) {
      if (lines.any((e) => e.title == _lineArticlesToUpdate[i].title)) {
        final match =
            lines.where((e) => e.title == _lineArticlesToUpdate[i].title);
        // print('match.length ${match.length}');
        if (match.length > 1) {
          //print(
          //    'dups found x${match.length} times : ${_lineArticlesToUpdate[i].toString()}');
          throw 'x${match.length} articles ont le titre ${lines[i].title}, veuillez les renommer pour éviter les erreurs d\'import';
        } else {
          // print('try copy');
          final _u = match.first.copyWith(articles: [
            (match.first.articles.first as Article).copyWith(
              price: (_lineArticlesToUpdate[i].articles.first as Article).price,
              cost: (_lineArticlesToUpdate[i].articles.first as Article).cost,
              articleCode: _lineArticlesToUpdate[i]
                  .articles
                  .first
                  .articleCode, //TODO ask Sidy if this is better than title
            )
          ]);
          print('try add');
          listToUpdate.add(_u);
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
    final updatedLine = await _articlesService.updateLineRpc.request(line);
    final index = lines.indexWhere((element) => element.id == updatedLine.id);
    lines.removeAt(index);
    lines.add(updatedLine);
    return updatedLine;
  }

  @action
  Future<ObservableList<LineOfArticles>> importCatalogueFromJson(
      String json) async {
    final _lineArticles = (convert.json.decode(json) as List)
        .cast<Map>() // ?
        .cast<Map<String, dynamic>>()
        .map((line) => LineOfArticles.fromMap(line))
        .toList();
    lines = ObservableList.of(_lineArticles);
    await _articlesService.addAllLinesRpc.request(lines);
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
    final _lineArticle =
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
        await _articlesService.updateLineRpc.request(productFalse);
    var productIndex = stockLowProduct.id;
    lines[productIndex] = stockLowProduct;
    return stockLowProduct;
  }

  @action // not used at the moment
  Future<LineOfArticles> restoreLineArticle(LineOfArticles _line) async {
    final restoredLine = await _articlesService.updateLineRpc.request(_line);
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
    var lineToDelete;
    final listOfArticleBasketToDelete = [];

    for (final line in lines.where((l) => (l.isBasket ?? false))) {
      for (final article in line.articles) {
        if ((article as ArticleBasket)
            .proxies
            .any((element) => element.proxyLineId == productData.id)) {
          if ((article as ArticleBasket).proxies.length > 1) {
            final index = (article as ArticleBasket)
                .proxies
                .indexWhere((element) => element.proxyLineId == productData.id);
            (article as ArticleBasket).proxies.removeAt(index);
            await _articlesService.updateArticleRpc.request(article);
            final _lineIndex = lines.indexOf(line);
            final _articleIndex = lines[_lineIndex].articles.indexOf(article);
            lines[_lineIndex].articles[_articleIndex] = article;
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
    var lineToDelete;
    final listOfArticleBasketToDelete = [];
    for (final line in lines.where((l) => (l.isBasket ?? false))) {
      for (final articleB in line.articles) {
        if ((articleB as ArticleBasket).proxies.any((proxy) =>
            proxy.proxyLineId == articleData.lineId &&
            proxy.proxyArticleId == articleData.id)) {
          if ((articleB as ArticleBasket).proxies.length > 1) {
            final _proxy = (articleB as ArticleBasket).proxies.firstWhereOrNull(
                (proxy) =>
                    proxy.proxyLineId == articleData.lineId &&
                    proxy.proxyArticleId == articleData.id);
            (articleB as ArticleBasket).proxies.remove(_proxy);
            final a = await _articlesService.updateArticleRpc.request(articleB);
            final _lineIndex = lines.indexOf(line);
            final _articleIndex = lines[_lineIndex].articles.indexOf(a);
            lines[_lineIndex].articles[_articleIndex] = a;
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
    final _lineArticle =
        lines.firstWhereOrNull((p) => p.id == articleData.productId);
    final _article =
        _lineArticle!.articles.firstWhereOrNull((a) => a.id == articleData.id);
    _lineArticle.articles.remove(_article);
    return lines;
  }

  @action
  Future<A> createArticle<A extends ArticleAbstract>(A articleData,
      {bool isTest = false}) async {
    final createdArticle =
        await _articlesService.createArticleRpc.request(articleData);
    final _lineArticle =
        lines.firstWhereOrNull((line) => line.id == createdArticle.lineId);
    _lineArticle!.articles.add(createdArticle);
    return createdArticle as A;
  }

  @action
  Future<A> updateArticle<A extends ArticleAbstract>(A articleData) async {
    final updatedArticle =
        await _articlesService.updateArticleRpc.request(articleData);
    final _lineArticle = lines
        .firstWhereOrNull((product) => product.id == updatedArticle.productId);
    final _lineArticleIndex = lines.indexOf(_lineArticle);
    final _article = _lineArticle!.articles
        .firstWhereOrNull((a) => a.id == updatedArticle.id);
    if (_article != null) {
      final articleIndex = _lineArticle.articles.indexOf(_article);
      lines[_lineArticleIndex].articles[articleIndex] = updatedArticle;

      // make sur that the function sparks an update in mobx => View
      final _line = lines[_lineArticleIndex];
      lines.removeAt(_lineArticleIndex);
      lines.add(_line);
      return updatedArticle as A;
    } else {
      throw 'error in updateArticle';
    }
  }
}
