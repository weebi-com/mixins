import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:mixins_weebi/src/mobx_stores/validators/articles/article/abstract.dart';

part 'update_retail_form.g.dart';

class ArticleRetailUpdateFormStore = _ArticleRetailUpdateFormStore
    with _$ArticleRetailUpdateFormStore;

abstract class _ArticleRetailUpdateFormStore
    extends FormStoreAbstractArticleRetail with Store, Validators {
  final ArticlesStore _articlesStore;
  final ArticleRetail _articleRetail;
  final String _initialFullName;

  _ArticleRetailUpdateFormStore(this._articlesStore, this._articleRetail)
      : _initialFullName = _articleRetail.fullName {
    name = _articleRetail.fullName;
    price = _articleRetail.price.toString();
    cost = _articleRetail.cost.toString();
    unitsPerPiece = _articleRetail.unitsPerPiece.toString();
    barcodeEAN = _articleRetail.barcodeEAN;
    if (_articlesStore.photos.any((element) =>
        element.calibreId == _articleRetail.calibreId &&
        element.id == _articleRetail.id)) {
      final photo = _articlesStore.photos.firstWhere((element) =>
          element.calibreId == _articleRetail.calibreId &&
          element.id == _articleRetail.id);

      photoPath = photo.path;
      photoSource = photo.source;
    }
  }

  @override
  FormErrorArticleRetailAbstract errorStore =
      FormErrorArticleRetailUpdateState();

  @override
  @observable
  String name = '';

  @override
  @observable
  String price = '';

  @override
  @observable
  String cost = '';

  @override
  @observable
  String unitsPerPiece = '';

  @observable
  String barcodeEAN = '';

  @observable
  String photoPath = '';

  @observable
  PhotoSource photoSource = PhotoSource.unknown;

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
      reaction((_) => name, validateArticleFullNameOnUpdate),
      reaction((_) => price, validatePrice),
      reaction((_) => cost, validateCost),
      reaction((_) => unitsPerPiece, validateUnitsPerPiece)
    ];
  }

  void validateAll() {
    validateArticleFullNameOnUpdate(name);
    validatePrice(price);
    validateCost(cost);
    validateUnitsPerPiece(unitsPerPiece);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateArticleFullNameOnUpdate(String value) {
    if (value.isEmpty) {
      errorStore.fullNameError = 'Saisir le nom de l\'article';
      return;
    }
    final isAlreadyTaken =
        _initialFullName.trim().withoutAccents.toLowerCase() !=
                (value.trim().withoutAccents.toLowerCase()) &&
            (_articlesStore.getArticlesFullNames
                .contains(value.trim().withoutAccents.toLowerCase()));

    if (isAlreadyTaken) {
      errorStore.fullNameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.fullNameError = null;
    return;
  }

  Future<ArticleRetail> updateArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticleRetail = _articleRetail.copyWith(
      fullName: name.trim(),
      price: num.parse(price.trim()),
      barcodeEAN: barcodeEAN.trim(),
      updateDate: now,
    );

    if (photoPath.isNotEmpty) {
      final newPhoto = ArticlePhoto(
          calibreId: newArticleRetail.calibreId,
          id: newArticleRetail.id,
          path: photoPath,
          source: PhotoSource.file);
      await _articlesStore.upsertPhoto(newPhoto);
    }
    if ((cost.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(cost: num.parse(cost.trim()));
    }
    if ((unitsPerPiece.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (int.tryParse(barcodeEAN.trim()) != null) {
      newArticleRetail =
          newArticleRetail.copyWith(barcodeEAN: barcodeEAN.trim());
    }

    final articleRetailUpdated =
        await _articlesStore.updateArticle<ArticleRetail>(newArticleRetail);
    return articleRetailUpdated;
  }
}

class FormErrorArticleRetailUpdateState = _FormErrorArticleRetailUpdateState
    with _$FormErrorArticleRetailUpdateState;

abstract class _FormErrorArticleRetailUpdateState
    extends FormErrorArticleRetailAbstract with Store {
  @observable
  String? fullNameError;

  @observable
  String? unitsPerPieceError;

  @observable
  String? costError;

  @computed
  bool get hasErrors =>
      fullNameError != null ||
      unitsPerPieceError != null ||
      priceError != null ||
      costError != null;
}
