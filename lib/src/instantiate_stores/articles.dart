import 'package:mixins_weebi/src/mobx_stores/articles.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:services_weebi/db_wrappers.dart';
import 'package:services_weebi/services_weebi.dart';

class ArticlesStoreInstantiater {
  static ArticlesStore get noPersistence =>
      ArticlesStore(const ArticlesServiceNoSembast());

  static ArticlesStore noPersistenceWithData(
      {required List<ArticleCalibre<ArticleAbstract>> articlesInitData,
      List<ArticlePhoto>? photos}) {
    final articlesStore = ArticlesStore(const ArticlesServiceNoSembast());
    articlesStore
        .init(data: articlesInitData, photosData: photos)
        .then((value) => print('articles init completed'));
    // we should await but provider does not exepect a Future so try it like that
    print('articlesStore inited');
    return articlesStore;
  }

  static ArticlesStore instArticlesStoreSembastTest(DbArticles dbArticles) =>
      ArticlesStore(
        ArticlesServiceInstantiater.instArticlesStoreSembastTest(dbArticles),
      );
}
