import 'package:mixins_weebi/mobx_stores/articles.dart';
import 'package:models_weebi/db.dart';
import 'package:services_weebi/rpc_articles.dart';
import 'package:services_weebi/services_weebi.dart';

class ArticlesStoreInstantiater {
  static ArticlesStore get instArticlesStoreNoPersistenceTest {
    const articlesServiceNoSembast = ArticlesServiceNoSembast();

    return ArticlesStore(articlesServiceNoSembast);
  }

  static ArticlesStore instArticlesStoreSembastTest(DbArticles dbArticles) {
    final getLinesRpc = GetLinesRpc(dbArticles);
    final saveAllProductsRpc = AddAllLineArticlesRpc(dbArticles);
    final updateProductRpc = UpdateLineArticleRpc(dbArticles);
    final deleteForeverProductRpc = DeleteForeverLineArticleRpc(dbArticles);
    final updateArticleRpc = UpdateArticleRpc(dbArticles);
    final createLineArticleRpc = CreateArticleLineRpc(dbArticles);
    final createArticleRpc = CreateArticleRpc(dbArticles);
    final deleteForeverArticleRpc = DeleteForeverArticleRpc(dbArticles);
    final deleteAllProductsRpc = DeleteAllArticleLinesRpc(dbArticles);

    final ArticlesService articlesService = ArticlesService(
      getLinesRpc,
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
