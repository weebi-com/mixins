import 'package:test/test.dart';
import 'package:models_weebi/weebi_models.dart';

import 'package:mixins_weebi/mobx_store_article.dart';

void main() {
  final articlesStoreTest = ArticlesStoreInstantiater.noPersistence;
  group('test photo', () {
    test('CRUD photo', () async {
      final photo = await articlesStoreTest.upsertPhoto(ArticlePhoto.dummy);
      final isDeleted = await articlesStoreTest.deletePhoto(photo);
      expect(isDeleted, true);
      expect(articlesStoreTest.photos.isEmpty, true);

      final photo2 = ArticlePhoto.dummy.copyWith(path: 'lovingDaTest');
      final photo2Saved = await articlesStoreTest.upsertPhoto(photo2);
      expect(photo2Saved, photo2);
      expect(articlesStoreTest.photos.first, photo2);
    });

    test('check that photo is deleted when calibre is deleted', () async {
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final photo = await articlesStoreTest.upsertPhoto(ArticlePhoto.dummy);
      expect(photo, ArticlePhoto.dummy);
      expect(articlesStoreTest.photos.first, ArticlePhoto.dummy);
      final remainings =
          await articlesStoreTest.deleteForeverCalibre(createdCalibre1);
      expect(remainings.isEmpty, isTrue);
      expect(articlesStoreTest.photos.isEmpty, isTrue);
    });
    test('check that photo is deleted when article retail is deleted',
        () async {
      final createdCalibre1 = await articlesStoreTest
          .createAndCalibrateArticle<ArticleRetail>(ArticleCalibre.dummyRetail);
      final photo = await articlesStoreTest.upsertPhoto(ArticlePhoto.dummy);
      expect(photo, ArticlePhoto.dummy);
      expect(articlesStoreTest.photos.first, ArticlePhoto.dummy);
      final remainings = await articlesStoreTest
          .deleteForeverArticle(createdCalibre1.articles.first);
      expect(remainings.isEmpty, isTrue);
      expect(articlesStoreTest.photos.isEmpty, isTrue);
    });
  });
}
