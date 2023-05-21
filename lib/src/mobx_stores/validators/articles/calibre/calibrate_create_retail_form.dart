import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
// ignore: import_of_legacy_library_into_null_safe

part 'calibrate_create_retail_form.g.dart';

class ArticleCalibreCreateFormStore = _ArticleCalibreCreateFormStore
    with _$ArticleCalibreCreateFormStore;

abstract class _ArticleCalibreCreateFormStore with Store {
  final ArticlesStore _articlesStore;
  _ArticleCalibreCreateFormStore(this._articlesStore) {
//
  }
  final FormErrorLineArticleCreateState errorStore =
      FormErrorLineArticleCreateState();
  @observable
  String name = '';

  @observable
  String price = '';

  @observable
  String cost = '';

  @observable
  StockUnit stockUnit = StockUnit.unit;

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
      reaction((_) => name, validateArticleCalibreName),
      reaction((_) => price, validatePrice),
      reaction((_) => cost, validateCost),
      reaction((_) => unitsPerPiece, validateUnitsPerPiece)
    ];
  }

  @action
  void validateArticleCalibreName(String value) {
    if (value.isEmpty) {
      errorStore.nameError = 'Saisir le nom de l\'article';
      return;
    }

    final isAlreadyTaken = _articlesStore.getCalibresNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isAlreadyTaken) {
      errorStore.nameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.nameError = '';
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
    validateArticleCalibreName(name);
    validatePrice(price);
    validateCost(cost);
    validateUnitsPerPiece(unitsPerPiece);
  }

  Future<ArticleCalibre<ArticleRetail>>
      createLineAndArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticle = ArticleRetail(
      calibreId: _articlesStore.calibres.nextId,
      id: 1,
      fullName: name.trim(),
      price: int.parse(price.trim()),
      cost: 0,
      weight: 1,
      barcodeEAN: barcodeEAN.trim(),
      photo: '',
      articleCode: _articlesStore.calibres.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      status: true,
      statusUpdateDate: now,
    );

    if ((cost.isNotEmpty)) {
      newArticle = newArticle.copyWith(cost: int.parse(cost.trim()));
    }
    if ((unitsPerPiece.isNotEmpty)) {
      newArticle =
          newArticle.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (barcodeEAN.isNotEmpty && int.tryParse(barcodeEAN.trim()) != null) {
      newArticle = newArticle.copyWith(barcodeEAN: barcodeEAN.trim());
    }

    final newLine = ArticleCalibre<ArticleRetail>(
        id: _articlesStore.calibres.nextId,
        title: name.trim(),
        stockUnit: stockUnit,
        categories: [''],
        creationDate: now,
        updateDate: now,
        status: true,
        statusUpdateDate: now,
        articles: [newArticle]);

    final articleLine =
        await _articlesStore.createCalibrateArticle<ArticleRetail>(newLine);
    return articleLine;
  }
}

class FormErrorLineArticleCreateState = _FormErrorLineArticleCreateState
    with _$FormErrorLineArticleCreateState;

abstract class _FormErrorLineArticleCreateState with Store {
  @observable
  String nameError = '';

  @observable
  String unitsPerPieceError = '';

  @observable
  String priceError = '';

  @observable
  String costError = '';

  @computed
  bool get hasErrors =>
      nameError.isNotEmpty ||
      unitsPerPieceError.isNotEmpty ||
      priceError.isNotEmpty ||
      costError.isNotEmpty;
}
