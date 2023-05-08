import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
// ignore: import_of_legacy_library_into_null_safe

part 'article_line_create_form_store.g.dart';

class ArticleLineCreateFormStore = _ArticleLineCreateFormStore
    with _$ArticleLineCreateFormStore;

abstract class _ArticleLineCreateFormStore with Store {
  final ArticlesStore _articlesStore;
  _ArticleLineCreateFormStore(this._articlesStore) {
//
  }
  final FormErrorState errorStore = FormErrorState();
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

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateArticleLineName),
      reaction((_) => price, validatePrice),
      reaction((_) => cost, validateCost),
      reaction((_) => unitsPerPiece, validateUnitsPerPiece)
    ];
  }

  @action
  void validateArticleLineName(String value) {
    if (value == null || value.isEmpty) {
      errorStore.nameError = 'Saisir le nom de l\'article';
      return;
    }

    final isValid = _articlesStore.getLinesNames
            .contains(value.trim().withoutAccents.toLowerCase()) ==
        false;
    if (isValid == false) {
      errorStore.nameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.nameError = null;
    return;
  }

  @action
  void validatePrice(String value) {
    if (value == null || value.isEmpty) {
      errorStore.priceError = 'Saisir le prix de vente';
    } else if (int.tryParse(value) == null) {
      errorStore.priceError = 'erreur $value';
    } else {
      errorStore.priceError = null;
    }
    return;
  }

  @action
  void validateCost(String value) {
    if (value.isNotEmpty && int.tryParse(value) == null) {
      errorStore.costError = 'erreur $value';
    } else {
      errorStore.costError = null;
    }
    return;
  }

  @action
  void validateUnitsPerPiece(String value) {
    if (value != null && value.isNotEmpty && double.tryParse(value) == null) {
      errorStore.unitsPerPieceError =
          'erreur $value, exemple : 1.5 et non pas 1,5';
    } else {
      errorStore.unitsPerPieceError = null;
    }
    return;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateArticleLineName(name);
    validatePrice(price);
    validateCost(cost);
    validateUnitsPerPiece(unitsPerPiece);
  }

  Future<ArticleLine<ArticleRetail>>
      createLineAndArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticle = ArticleRetail(
      lineId: _articlesStore.lines.nextId,
      id: 1,
      fullName: name.trim() ?? '',
      price: int.parse(price.trim()),
      cost: 0,
      weight: 1,
      barcodeEAN: barcodeEAN.trim(),
      photo: '',
      articleCode: _articlesStore.lines.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      status: true,
      statusUpdateDate: now,
    );

    if ((cost != null && cost.isNotEmpty)) {
      newArticle = newArticle.copyWith(cost: int.parse(cost.trim()));
    }
    if ((unitsPerPiece != null && unitsPerPiece.isNotEmpty)) {
      newArticle =
          newArticle.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (barcodeEAN != null &&
        barcodeEAN is String &&
        int.tryParse(barcodeEAN.trim()) != null) {
      newArticle = newArticle.copyWith(barcodeEAN: barcodeEAN.trim());
    }

    final newLine = ArticleLine<ArticleRetail>(
        id: _articlesStore.lines.nextId,
        title: name.trim(),
        stockUnit: stockUnit,
        categories: [''],
        creationDate: now,
        updateDate: now,
        status: true,
        statusUpdateDate: now,
        articles: [newArticle]);

    final articleLine =
        await _articlesStore.createLineArticle<ArticleRetail>(newLine);
    return articleLine;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String nameError;

  @observable
  String unitsPerPieceError;

  @observable
  String priceError;

  @observable
  String costError;

  @computed
  bool get hasErrors =>
      nameError != null ||
      unitsPerPieceError != null ||
      priceError != null ||
      costError != null;
}
