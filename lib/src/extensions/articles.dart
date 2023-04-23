import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<ArticleLines> {
  ObservableList<ArticleLines> filterByTitle(String queryString) {
    return ObservableList<ArticleLines>.of(where((p) => p.isPalpable ?? true)
        .where((p) => p.title != '*')
        .where((p) => p.title
            .toLowerCase()
            .withoutAccents
            .contains(queryString.withoutAccents.toLowerCase())));
  }

  ObservableList<ArticleLines> get isStatus =>
      ObservableList<ArticleLines>.of(where((p) => p.status));

  ObservableList<ArticleLines> get isPalpable =>
      ObservableList<ArticleLines>.of(where((p) => p.isPalpable ?? true));
}
