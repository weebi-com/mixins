import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

part 'create_retail_form.g.dart';

class ArticleRetailCreateFormStore = _ArticleCreateFormStore
    with _$ArticleRetailCreateFormStore;

abstract class _ArticleCreateFormStore with Store {
  final ArticlesStore _articlesStore;
  final ArticleCalibre _line;
  _ArticleCreateFormStore(this._articlesStore, this._line) {
    fullName = _line.nameLine;
  }
  final FormErrorArticleCreateState errorStore = FormErrorArticleCreateState();
  @observable
  String fullName = '';

  @observable
  String price = '';

  @observable
  String cost = '';

  @observable
  String unitsPerPiece = '';

  @observable
  String barcodeEAN = '';

  @observable
  ObservableFuture<bool> isArticleCreated = ObservableFuture.value(false);

  @computed
  bool get isArticleCreationPending =>
      isArticleCreated.status == FutureStatus.pending;

  @computed
  bool get hasErrors => errorStore.hasErrors;

  List<ReactionDisposer> _disposers = [];

  void setupValidations() {
    _disposers = [
      reaction((_) => fullName, validateArticleFullName),
      reaction((_) => price, validatePrice),
      reaction((_) => cost, validateCost),
      reaction((_) => unitsPerPiece, validateUnitsPerPiece)
    ];
  }

  @action
  void validateArticleFullName(String value) {
    if (value.isEmpty) {
      errorStore.fullNameError = 'Saisir le nom de l\'article';
      return;
    }

    final isSameAsLineName = _articlesStore.getCalibresNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isSameAsLineName) {
      errorStore.fullNameError =
          'Le nom doit être différent de l\'article, ex : Cola x1 au lieu de Cola';
      return;
    }
    final isAlreadyTaken = _articlesStore.getArticlesFullNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isAlreadyTaken) {
      errorStore.fullNameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.fullNameError = '';
    return;
  }

  @action
  void validatePrice(String value) {
    if (value.isEmpty) {
      errorStore.priceError = 'Saisir le prix de vente';
    } else if (int.tryParse(value) == null) {
      errorStore.priceError = 'erreur $value';
    } else {
      errorStore.priceError = '';
    }
    return;
  }

  @action
  void validateCost(String value) {
    if (value.isNotEmpty && int.tryParse(value) == null) {
      errorStore.costError = 'erreur $value';
    } else {
      errorStore.costError = '';
    }
    return;
  }

  @action
  void validateUnitsPerPiece(String value) {
    if (value.isNotEmpty && double.tryParse(value) == null) {
      errorStore.unitsPerPieceError =
          'erreur $value, exemple : 1.5 et non pas 1,5';
    } else {
      errorStore.unitsPerPieceError = '';
    }
    return;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateArticleFullName(fullName);
    validatePrice(price);
    validateCost(cost);
    validateUnitsPerPiece(unitsPerPiece);
  }

  Future<ArticleRetail> createArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticleRetail = ArticleRetail(
      calibreId: _line.id,
      id: _line.articles.nextId,
      fullName: fullName.trim(),
      price: int.parse(price.trim()),
      cost: 0,
      weight: 1,
      photo: '',
      barcodeEAN: barcodeEAN.trim(),
      articleCode: _articlesStore.calibres.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      status: true,
      statusUpdateDate: now,
    );

    if ((cost.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(cost: int.parse(cost.trim()));
    }
    if ((unitsPerPiece.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (int.tryParse(barcodeEAN.trim()) != null) {
      newArticleRetail =
          newArticleRetail.copyWith(barcodeEAN: barcodeEAN.trim());
    }

    final articleRetailCreated = await _articlesStore
        .createArticleRetail<ArticleRetail>(newArticleRetail);
    return articleRetailCreated;
  }
}

class FormErrorArticleCreateState = _FormErrorArticleCreateState
    with _$FormErrorArticleCreateState;

abstract class _FormErrorArticleCreateState with Store {
  @observable
  String fullNameError = '';

  @observable
  String unitsPerPieceError = '';

  @observable
  String priceError = '';

  @observable
  String costError = '';

  @computed
  bool get hasErrors =>
      fullNameError.isNotEmpty ||
      unitsPerPieceError.isNotEmpty ||
      priceError.isNotEmpty ||
      costError.isNotEmpty;
}
