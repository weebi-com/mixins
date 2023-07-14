import 'package:mixins_weebi/mobx_store_article.dart';
import 'package:mobx/mobx.dart';
import 'package:models_weebi/common.dart';
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:mixins_weebi/src/mobx_stores/validators/articles/article/abstract.dart';

part 'create_retail_form.g.dart';

class ArticleRetailCreateFormStore = _ArticleCreateFormStore
    with _$ArticleRetailCreateFormStore;

abstract class _ArticleCreateFormStore extends FormStoreAbstractArticleRetail
    with Store, Validators {
  final ArticlesStore _articlesStore;
  final ArticleCalibre _calibre;
  _ArticleCreateFormStore(this._articlesStore, this._calibre) {
    name = _calibre.nameLine;
  }

  @override
  FormErrorArticleRetailAbstract errorStore = FormErrorArticleCreateState();

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
  ObservableFuture<bool> isArticleCreated = ObservableFuture.value(false);

  @computed
  bool get isArticleCreationPending =>
      isArticleCreated.status == FutureStatus.pending;

  @computed
  bool get hasErrors => errorStore.hasErrors;

  List<ReactionDisposer> _disposers = [];

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateArticleFullNameOnCreation),
      reaction((_) => price, validatePrice),
      reaction((_) => cost, validateCost),
      reaction((_) => unitsPerPiece, validateUnitsPerPiece)
    ];
  }

  void validateAll() {
    validateArticleFullNameOnCreation(name);
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
  void validateArticleFullNameOnCreation(String value) {
    if (value.isEmpty) {
      errorStore.fullNameError = 'Saisir le nom de l\'article';
      return;
    }

    final isAlreadyTaken = _articlesStore.getArticlesFullNames
        .contains(value.trim().withoutAccents.toLowerCase());
    if (isAlreadyTaken) {
      errorStore.fullNameError = 'Un article avec ce nom existe déjà';
      return;
    }
    errorStore.fullNameError = null;
    return;
  }

  Future<ArticleRetail> createArticleRetailFromForm() async {
    final now = DateTime.now();
    ArticleRetail newArticleRetail = ArticleRetail(
      calibreId: _calibre.id,
      id: _calibre.articles.nextId,
      fullName: name.trim(),
      price: num.parse(price.trim()),
      cost: 0,
      weight: 1,
      barcodeEAN: barcodeEAN.trim(),
      articleCode: _articlesStore.calibres.nextId * 10 + 1,
      creationDate: now,
      updateDate: now,
      status: true,
      statusUpdateDate: now,
    );
    if (photoPath.isNotEmpty) {
      final photo = ArticlePhoto(
          calibreId: _articlesStore.calibres.nextId,
          id: 1,
          path: photoPath,
          source: PhotoSource.file);
      await _articlesStore.createPhoto(photo);
    }
    if ((cost.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(cost: num.parse(cost.trim()));
    }
    if ((unitsPerPiece.isNotEmpty)) {
      newArticleRetail =
          newArticleRetail.copyWith(weight: double.parse(unitsPerPiece.trim()));
    }
    if (barcodeEAN.isNotEmpty && int.tryParse(barcodeEAN.trim()) != null) {
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

abstract class _FormErrorArticleCreateState
    with Store
    implements FormErrorArticleRetailAbstract {
  @observable
  String? fullNameError;

  @observable
  String? unitsPerPieceError;

  @observable
  @override
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
