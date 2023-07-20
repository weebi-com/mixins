import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mixins_weebi/src/mobx_stores/validators/articles/article/abstract.dart';
part 'calibrate_create_retail_form.g.dart';

class ArticleCalibreCreateFormStore = _ArticleCalibreCreateFormStore
    with _$ArticleCalibreCreateFormStore;

abstract class _ArticleCalibreCreateFormStore
    extends FormStoreAbstractArticleRetail with Store, Validators {
  final ArticlesStore _articlesStore;
  _ArticleCalibreCreateFormStore(this._articlesStore) {}
  @override
  FormErrorArticleRetailAbstract errorStore = FormErrorLineArticleCreateState();
  @observable
  @override
  String name = '';

  @observable
  @override
  String price = '';

  @observable
  @override
  String cost = '0';

  @observable
  @override
  String unitsPerPiece = '1';

  @observable
  String photoPath = '';

  @observable
  StockUnit stockUnit = StockUnit.unit;

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
      errorStore.fullNameError = 'Saisir le nom de l\'article';
      return;
    }

    final isAlreadyTaken = _articlesStore.getCalibresNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isAlreadyTaken) {
      errorStore.fullNameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.fullNameError = null;
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
      price: num.parse(price.trim()),
      cost: 0,
      weight: 1,
      barcodeEAN: barcodeEAN.trim(),
      articleCode: _articlesStore.calibres.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      statusUpdateDate: now,
      status: true,
    );

    if (photoPath.isNotEmpty) {
      final photo = ArticlePhoto(
          calibreId: _articlesStore.calibres.nextId,
          id: 1,
          path: photoPath,
          source: PhotoSource.file);
      await _articlesStore.upsertPhoto(photo);
    }

    if ((cost.isNotEmpty)) {
      newArticle = newArticle.copyWith(cost: num.parse(cost.trim()));
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
        await _articlesStore.createAndCalibrateArticle<ArticleRetail>(newLine);
    return articleLine;
  }
}

class FormErrorLineArticleCreateState = _FormErrorLineArticleCreateState
    with _$FormErrorLineArticleCreateState;

abstract class _FormErrorLineArticleCreateState
    extends FormErrorArticleRetailAbstract with Store {
  @observable
  String? fullNameError;

  @observable
  String? unitsPerPieceError;

  @observable
  String? priceError;

  @observable
  String? costError;

  @computed
  bool get hasErrors =>
      fullNameError != null ||
      unitsPerPieceError != null ||
      priceError != null ||
      costError != null;
}
