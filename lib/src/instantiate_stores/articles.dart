import 'package:mixins_weebi/src/mobx_stores/articles.dart';
import 'package:services_weebi/db_wrappers.dart';
import 'package:services_weebi/services_weebi.dart';

class ArticlesStoreInstantiater {
  static ArticlesStore get noPersistence =>
      ArticlesStore(const ArticlesServiceNoSembast());

  static ArticlesStore instArticlesStoreSembastTest(DbArticles dbArticles) =>
      ArticlesStore(
        ArticlesServiceInstantiater.instArticlesStoreSembastTest(dbArticles),
      );
}
