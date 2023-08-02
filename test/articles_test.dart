import 'package:test/test.dart';
import 'package:models_weebi/utils.dart';
import 'package:models_weebi/weebi_models.dart';

import 'package:mixins_weebi/mobx_store_article.dart';

void main() {
  final articlesStoreTest = ArticlesStoreInstantiater.noPersistence;

  group('test articles store', () {
    test('create calibre & article', () async {
      final isDeleted =
          await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
      expect(isDeleted, isTrue);
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      expect(createdCalibre1 == ArticleCalibre.dummyRetail, isTrue);
      expect(
          createdCalibre1.articles.first ==
              ArticleCalibre.dummyRetail.articles.first,
          isTrue);
      expect(createdCalibre1.articles.first.id, 1);
      expect(articlesStoreTest.calibres.length, 1);
    });
    test('add_article', () async {
      final isDeleted =
          await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
      expect(isDeleted, isTrue);
      await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final calibre2AWeebiArticle2 = ArticleRetail(
        creationDate: WeebiDates.defaultDate,
        updateDate: WeebiDates.defaultDate,
        status: true,
        id: 2,
        calibreId: 1,
        fullName: 'truc x2',
        price: 20,
        weight: 2.0,
        cost: 0,
        articleCode: 0,
      );
      final createdArticle2Product2 = await articlesStoreTest
          .createArticleRetail<ArticleRetail>(calibre2AWeebiArticle2,
              isTest: true);
      expect(createdArticle2Product2, calibre2AWeebiArticle2);
      expect(createdArticle2Product2.id, 2);
      expect(createdArticle2Product2.calibreId, 1);

      expect(
          articlesStoreTest.calibres
              .firstWhere((element) => element.id == 1)
              .articles
              .length,
          2);
    });
    test('deactivate_article', () async {
      final now = DateTime.now();
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final deactivated = (createdCalibre1.articles.first).copyWith(
        statusUpdateDate: now,
        status: false,
      );
      final dd = await articlesStoreTest.updateArticle(deactivated);
      expect(dd.status, false);
      expect(
          (articlesStoreTest.calibres.first.articles.first as ArticleRetail)
              .statusUpdateDate,
          now);
    });
    test('reactivate_article', () async {
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final deactivated = (createdCalibre1.articles.first).copyWith(
        statusUpdateDate: WeebiDates.defaultFirstDate,
        status: false,
      );
      final now = DateTime.now();
      await articlesStoreTest.updateArticle<ArticleRetail>(deactivated);
      final reactivated = (createdCalibre1.articles.first).copyWith(
        statusUpdateDate: now,
        status: true,
      );
      final dd =
          await articlesStoreTest.updateArticle<ArticleRetail>(reactivated);
      expect(dd.status, true);
      expect(
          (articlesStoreTest.calibres.first.articles.first as ArticleRetail)
              .statusUpdateDate,
          now);
    });
    test('update_article', () async {
      await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final _articleBasketLine2A =
          ArticleCalibre.dummyRetail.articles.first.copyWith(cost: 123);
      final updated = await articlesStoreTest
          .updateArticle<ArticleRetail>(_articleBasketLine2A);
      expect(updated.cost, 123);
      expect(
          (articlesStoreTest.calibres.first.articles.first as ArticleRetail)
              .cost,
          123);
    });
    test('update calibre retail', () async {
      final d = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final testTitle = d.copyWith(title: 'poupoupidou');
      final dd =
          await articlesStoreTest.updateLineArticle<ArticleRetail>(testTitle);
      print(dd.title);
      expect(dd.title, 'poupoupidou');
      expect(
          articlesStoreTest.calibres
              .any((element) => element.title == 'poupoupidou'),
          isTrue);
    });
    test('delete forever retail', () async {
      final isDeleted =
          await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
      expect(isDeleted, isTrue);
      expect(articlesStoreTest.calibres.isEmpty, true);
      await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      await articlesStoreTest.createAndCalibrateArticle<ArticleRetail>(
          ArticleCalibre.dummyRetail.copyWith(id: 2));
      expect(articlesStoreTest.calibres.length, 2);
      await articlesStoreTest.deleteForeverCalibre(ArticleCalibre.dummyRetail);
      expect(articlesStoreTest.calibres.length, 1);
    });
  });

  group('test basket', () {
    test('create basket & article basket', () async {
      final isDeleted =
          await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
      expect(isDeleted, isTrue);
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleBasket>(ArticleCalibre.dummyBasket);

      expect(createdCalibre1 == ArticleCalibre.dummyBasket, isTrue);
      expect(createdCalibre1.articles.first,
          ArticleCalibre.dummyBasket.articles.first);
      expect(createdCalibre1.articles.first.id, 1);
      expect(
          (ArticleCalibre.dummyBasket.articles.first).proxies.first.calibreId,
          2);
      expect(
          (ArticleCalibre.dummyBasket.articles.first).proxies.first.articleId,
          1);
      expect((ArticleCalibre.dummyBasket.articles.first).proxies.first.id, 1);
      expect(articlesStoreTest.calibres.length, 1);
    });

    test('update_articlebasket', () async {
      final calibreBasket = await articlesStoreTest
          .createAndCalibrateArticle<ArticleBasket>(ArticleCalibre.dummyBasket);
      expect(calibreBasket, ArticleCalibre.dummyBasket);
      final _articleBasket = ArticleCalibre.dummyBasket.articles.first
          .copyWith(fullName: 'ouais ouais');
      final updated =
          await articlesStoreTest.updateArticle<ArticleBasket>(_articleBasket);
      expect(updated.fullName, 'ouais ouais');
    });
    test('update calibre basket', () async {
      final updatedCBasket =
          ArticleCalibre.dummyBasket.copyWith(title: 'poupoupidou');
      final temp = await articlesStoreTest
          .updateLineArticle<ArticleBasket>(updatedCBasket);
      expect(temp.title, 'poupoupidou');
      await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
    });
    test('delete forever calibre basket', () async {
      await articlesStoreTest
          .createAndCalibrateArticle<ArticleBasket>(ArticleCalibre.dummyBasket);
      expect(articlesStoreTest.calibres.length, 1);
      print('length ok');
      await articlesStoreTest.deleteForeverCalibre(ArticleCalibre.dummyBasket);
      expect(articlesStoreTest.calibres.length, 0);
    });
    test('delete_all', () async {
      await articlesStoreTest
          .createAndCalibrateArticle<ArticleBasket>(ArticleCalibre.dummyBasket);
      await articlesStoreTest.deleteAllArticlesAndPhotosAndCalibres();
      expect(articlesStoreTest.calibres.isEmpty, true);
    });
  });
}
