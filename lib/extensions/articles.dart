import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<LineOfArticles> {
  ObservableList<LineOfArticles> filterByTitle(String queryString) {
    return ObservableList<LineOfArticles>.of(where((p) => p.isPalpable ?? true)
        .where((p) => p.title != '*')
        .where((p) => p.title
            .toLowerCase()
            .withoutAccents
            .contains(queryString.withoutAccents.toLowerCase())));
  }

  ObservableList<LineOfArticles> get isStatus =>
      ObservableList<LineOfArticles>.of(where((p) => p.status));

  ObservableList<LineOfArticles> get isPalpable =>
      ObservableList<LineOfArticles>.of(where((p) => p.isPalpable ?? true));
}
