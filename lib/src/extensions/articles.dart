import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<ArticleLine> {
  ObservableList<ArticleLine> filterByTitle(String queryString) {
    return ObservableList<ArticleLine>.of(where((p) => p.isPalpable ?? true)
        .where((p) => p.title != '*')
        .where((p) => p.title
            .toLowerCase()
            .withoutAccents
            .contains(queryString.withoutAccents.toLowerCase())));
  }

  ObservableList<ArticleLine> get isStatus =>
      ObservableList<ArticleLine>.of(where((p) => p.status));

  ObservableList<ArticleLine> get isPalpable =>
      ObservableList<ArticleLine>.of(where((p) => p.isPalpable ?? true));
}
