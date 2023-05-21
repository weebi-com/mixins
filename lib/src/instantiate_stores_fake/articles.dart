import 'package:mixins_weebi/src/mobx_stores/articles.dart';
import 'package:services_weebi/db_wrappers.dart';
import 'package:services_weebi/rpc_articles.dart';
import 'package:services_weebi/services_weebi.dart';

class ArticlesStoreInstantiater {
  static ArticlesStore get noPersistence {
    const articlesServiceNoSembast = ArticlesServiceNoSembast();
    return ArticlesStore(articlesServiceNoSembast);
  }

  static ArticlesStore instArticlesStoreSembastTest(DbArticles dbArticles) {
    final getCalibresRpc = GetArticleCalibersRpc(dbArticles);
    final saveAllProductsRpc = AddAllArticleCalibresRpc(dbArticles);
    final updateProductRpc = UpdateLineArticleRpc(dbArticles);
    final deleteForeverProductRpc =
        DeleteForeverCalibreAndItsArticlesRpc(dbArticles);
    final updateArticleRpc = UpdateArticleRpc(dbArticles);
    final createLineArticleRpc = CreateArticleCalibreRpc(dbArticles);
    final createArticleRpc = CreateArticleRpc(dbArticles);
    final deleteForeverArticleRpc = DeleteForeverArticleRpc(dbArticles);
    final deleteAllProductsRpc = DeleteAllArticleCalibreRpc(dbArticles);

    final ArticlesService articlesService = ArticlesService(
      getCalibresRpc,
      saveAllProductsRpc,
      updateProductRpc,
      deleteForeverProductRpc,
      updateArticleRpc,
      createLineArticleRpc,
      createArticleRpc,
      deleteForeverArticleRpc,
      deleteAllProductsRpc,
    );

    return ArticlesStore(articlesService);
  }
}
