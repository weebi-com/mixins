import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<ArticleCalibre> {
  ObservableList<ArticleCalibre> searchByTitleOrId(String queryString) {
    return ObservableList<ArticleCalibre>.of(where((p) => p.title != '*')
        .where((p) => p.isNotQuickSpend)
        .where((p) =>
            p.title
                .toLowerCase()
                .trim()
                .withoutAccents
                .contains(queryString.trim().withoutAccents.toLowerCase()) ||
            p.id.toString().contains(queryString))
        .toList());
  }

  ObservableList<ArticleCalibre> get notDeactivated =>
      ObservableList<ArticleCalibre>.of(where((p) => p.status));

  ObservableList<ArticleCalibre> get palpables =>
      ObservableList<ArticleCalibre>.of(where((p) => p.isPalpable ?? true));
}
