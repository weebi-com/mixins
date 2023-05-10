import 'package:mixins_weebi/src/instantiate_stores/articles.dart';
import 'package:mixins_weebi/src/mobx_stores/validators/articles/line/create_line_retail_form.dart';
import 'package:models_weebi/weebi_models.dart';
import 'package:test/test.dart';

final line = ArticleLine.dummy;

void main() {
  test('article_form line create validator', () async {
    final articlesStore = ArticlesStoreInstantiater.noPersistence;
    final store = ArticleLineCreateFormStore(articlesStore);
    store.setupValidations();
    store.name = line.title;
    store.price = line.articles.first.price.toString();
    store.cost = line.articles.first.cost.toString();
    store.unitsPerPiece = line.articles.first.unitsPerPiece.toString();
    store.barcodeEAN = line.articles.first.barcodeEAN;

    store.name = '';
    expect(store.hasErrors, isTrue); // name is required
    store.name = line.title;

    store.price = '';
    expect(store.hasErrors, isTrue); // price is required
    store.price = line.articles.first.price.toString();

    store.cost = '';
    expect(store.hasErrors, isFalse); // no need to set this one
    store.unitsPerPiece = '';
    expect(store.hasErrors, isFalse); // no need to set this one either
    store.barcodeEAN = '';
    expect(store.hasErrors, isFalse); // no need to set this one either either

    expect(store.hasErrors, isFalse);
    final createdLine = await store.createLineAndArticleRetailFromForm();
    expect(createdLine == line, isTrue);
    store.name = line.title;
    store.validateArticleLineName(store.name);
    expect(store.hasErrors, isTrue); // an article with this name already exists
  });
}
