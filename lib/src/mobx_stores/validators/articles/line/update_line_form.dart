import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/base.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
// ignore: import_of_legacy_library_into_null_safe

part 'update_line_form.g.dart';

class ArticleLineUpdateFormStore = _ArticleLineUpdateFormStore
    with _$ArticleLineUpdateFormStore;

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

  List<ReactionDisposer> _disposers = [];

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateArticleLineName),
    ];
  }

  @action
  void validateArticleLineName(String value) {
    if (value.isEmpty) {
      errorStore.nameError = 'Saisir le nom de l\'article';
      return;
    }

    final isAlreadyTaken = (value.trim().withoutAccents.toLowerCase() !=
            _initialName.trim().withoutAccents.toLowerCase()) &&
        (_articlesStore.getLinesNames
            .contains(value.trim().withoutAccents.toLowerCase()));
    if (isAlreadyTaken) {
      errorStore.nameError = 'Un article avec ce nom existe déjà';
      return;
    }

    errorStore.nameError = '';
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
      updateDate: now,
    );
    final temp = await _articlesStore.updateLineArticle<A>(lineEdited);
    return temp;
  }
}

class FormErrorArticleLineUpdateState = _FormErrorArticleLineUpdateState
    with _$FormErrorArticleLineUpdateState;

abstract class _FormErrorArticleLineUpdateState with Store {
  @observable
  String nameError = '';

  @computed
  bool get hasErrors => nameError.isNotEmpty;
}
