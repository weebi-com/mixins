import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

part 'update_retail_form.g.dart';

class ArticleRetailUpdateFormStore = _ArticleRetailUpdateFormStore
    with _$ArticleRetailUpdateFormStore;

abstract class _ArticleRetailUpdateFormStore with Store {
  final ArticlesStore _articlesStore;
  final ArticleRetail _articleRetail;
  final String _initialFullName;
  _ArticleRetailUpdateFormStore(this._articlesStore, this._articleRetail)
      : _initialFullName = _articleRetail.fullName {
    fullName = _articleRetail.fullName;
    price = _articleRetail.price.toString();
    cost = _articleRetail.cost.toString();
    unitsPerPiece = _articleRetail.unitsPerPiece.toString();
    barcodeEAN = _articleRetail.barcodeEAN;
  }
  final FormErrorArticleRetailUpdateState errorStore =
      FormErrorArticleRetailUpdateState();

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

  List<ReactionDisposer> _disposers;

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
    if (value == null || value.isEmpty) {
      errorStore.fullNameError = 'Saisir le nom de l\'article';
      return;
    }

    final isSameAsLineName = _articlesStore.getLinesNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isSameAsLineName) {
      errorStore.fullNameError =
          'Le nom de l\'article doit être différent de la ligne, ex : Cola x1 dans la ligne Cola';
      return;
    }

    final isAlreadyTaken = (value.trim().withoutAccents.toLowerCase() !=
            _initialFullName.trim().withoutAccents.toLowerCase()) ||
        (_articlesStore.getArticlesFullNames
            .contains(value.trim().withoutAccents.toLowerCase()));
    if (isAlreadyTaken) {
      errorStore.fullNameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.fullNameError = null;
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
    validateArticleFullName(fullName);
    validatePrice(price);
    validateCost(cost);
    validateUnitsPerPiece(unitsPerPiece);
  }

  Future<ArticleRetail> updateArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticleRetail = ArticleRetail(
      lineId: _articleRetail.lineId,
      id: _articleRetail.id,
      fullName: fullName.trim() ?? '',
      price: int.parse(price.trim()),
      cost: 0,
      weight: 1,
      photo: '',
      barcodeEAN: barcodeEAN.trim(),
      articleCode: _articlesStore.lines.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      status: true,
      statusUpdateDate: now,
    );

    if ((cost != null && cost.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(cost: int.parse(cost.trim()));
    }
    if ((unitsPerPiece != null && unitsPerPiece.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (barcodeEAN != null &&
        barcodeEAN is String &&
        int.tryParse(barcodeEAN.trim()) != null) {
      newArticleRetail =
          newArticleRetail.copyWith(barcodeEAN: barcodeEAN.trim());
    }

    final articleRetailUpdated = await _articlesStore
        .updateArticleRetail<ArticleRetail>(newArticleRetail);
    return articleRetailUpdated;
  }
}

class FormErrorArticleRetailUpdateState = _FormErrorArticleRetailUpdateState
    with _$FormErrorArticleRetailUpdateState;

abstract class _FormErrorArticleRetailUpdateState with Store {
  @observable
  String fullNameError;

  @observable
  String unitsPerPieceError;

  @observable
  String priceError;

  @observable
  String costError;

  @computed
  bool get hasErrors =>
      fullNameError != null ||
      unitsPerPieceError != null ||
      priceError != null ||
      costError != null;
}