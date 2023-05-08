import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
// ignore: import_of_legacy_library_into_null_safe

part 'article_line_update_form_store.g.dart';

class ArticleLineUpdateFormStore = _ArticleLineUpdateFormStore
    with _$ArticleFormStore;

abstract class _ArticleLineUpdateFormStore with Store {
  final ArticlesStore _articlesStore;
  final ArticleLine _line;
  final String _initialName;

  _ArticleLineUpdateFormStore(this._articlesStore, this._line)
      : _initialName = _line.nameLine {
    name = _line.nameLine;
    stockUnit = _line.stockUnit;
  }
  final FormErrorArticleLineUpdateState errorStore =
      FormErrorArticleLineUpdateState();
  @observable
  String name = '';

  @observable
  StockUnit stockUnit = StockUnit.unit;

  @computed
  bool get hasErrors => errorStore.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateArticleLineName),
    ];
  }

  @action
  void validateArticleLineName(String value) {
    if (value == null || value.isEmpty) {
      errorStore.nameError = 'Saisir le nom de l\'article';
      return;
    }

    final isValid = (value.trim().withoutAccents.toLowerCase() ==
            _initialName.trim().withoutAccents.toLowerCase()) ||
        (_articlesStore.getLinesNames
                .contains(value.trim().withoutAccents.toLowerCase()) ==
            false);
    if (isValid == false) {
      errorStore.nameError = 'Un article avec ce nom existe déjà';
      return;
    }

    errorStore.nameError = null;
    return;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateArticleLineName(name);
  }

  Future<ArticleLine<A>> updateLineArticleFromForm<A extends ArticleAbstract>(
      ArticleLine<A> line) async {
    final now = DateTime.now();
    final lineEdited = line.copyWith(
      title: name.trim(),
      stockUnit: stockUnit,
      creationDate: now,
      updateDate: now,
      statusUpdateDate: now,
    );
    final temp = await _articlesStore.updateLineArticle<A>(lineEdited);
    return temp;
  }
}

class FormErrorArticleLineUpdateState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String nameError;

  @computed
  bool get hasErrors => nameError != null;
}
