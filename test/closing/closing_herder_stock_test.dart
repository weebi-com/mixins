import 'package:mixins_weebi/src/instantiate_stores_fake/closings.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/utils.dart';
import 'package:test/test.dart';

Future main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;
  group('test closings herder stock ', () {
    test('herder stock', () async {
      final closingHerderStock =
          ClosingStockHerder(ClosingRange.dummyFeb, herderId: '1', products: [
        ClosingStockProduct(
          ClosingRange.dummyFeb.date,
          title: 'fromage abondance kg',
          id: 1,
          initialQtCl: 5.0,
          finalQtCl: 6.0,
          articles: [
            ClosingStockArticle(ClosingRange.dummyFeb.date,
                quantityIn: 1.0,
                quantityOut: 0.0,
                id: 1,
                productId: 1,
                fullName: 'fromage abondance kg',
                weight: 1.0,
                finalQtCl: 6.0,
                initialQtCl: 5.0),
          ],
        ),
      ]);
      await testClosingsStore.addAllClosingHerderStocks([closingHerderStock]);
      final _temp = testClosingsStore.herderStockProductFinalQuantity(
          WeebiDates.febEnd, 1, 1);
      expect(_temp, 6);
    });
  });
}
