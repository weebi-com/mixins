import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<ArticleLine> {
  ObservableList<ArticleLine> searchByTitleOrId(String queryString) {
    return ObservableList<ArticleLine>.of(where((p) => p.title != '*')
        .where((p) => p.isPalpable)
        .where((p) =>
            p.title
                .toLowerCase()
                .trim()
                .withoutAccents
                .contains(queryString.trim().withoutAccents.toLowerCase()) ||
            p.id.toString().contains(queryString))
        .toList());
  }

  ObservableList<ArticleLine> get notDeactivated =>
      ObservableList<ArticleLine>.of(where((p) => p.status));

  ObservableList<ArticleLine> get palpables =>
      ObservableList<ArticleLine>.of(where((p) => p.isPalpable ?? true));
}
