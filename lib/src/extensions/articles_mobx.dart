import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart' show ArticlesFilter;
import 'package:models_weebi/weebi_models.dart';

extension Filter on Iterable<ArticleCalibre> {
  ObservableList<ArticleCalibre> searchByTitleOrIdObs(String queryString) =>
      ObservableList<ArticleCalibre>.of(
          Set<ArticleCalibre>.of(searchByTitleOrId(queryString)));

  ObservableList<ArticleCalibre> searchByTitleObs(String queryString) =>
      ObservableList.of(searchByTitle(queryString));

  ObservableList<ArticleCalibre> searchByIdObs(String queryString) =>
      ObservableList<ArticleCalibre>.of(searchById(queryString));

  ObservableList<ArticleCalibre> get notDeactivatedObs =>
      ObservableList<ArticleCalibre>.of(notDeactivated);

  ObservableList<ArticleCalibre> get palpablesObs =>
      ObservableList<ArticleCalibre>.of(palpables);
}
