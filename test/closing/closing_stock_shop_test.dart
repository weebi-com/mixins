import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/utils.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;
  group('test closing stock shops', () {
    test('rangeStockShopProductQuantityDiff x1 closing', () async {
      final d =
          await testClosingsStore.addAllClosingRanges([ClosingRange.dummyFeb]);
      final dd = await testClosingsStore
          .addAllClosingStockShops(ClosingStockShop.dummyFeb);
      expect(d.isNotEmpty, isTrue);
      expect(dd.isNotEmpty, isTrue);
      final t = testClosingsStore.stockShopProductDiffTimeRange(
        ['pierre_entrepot'],
        1,
        WeebiDates.febStart,
        WeebiDates.febEnd,
      ).value;
      expect(t, 3.0);
    });
    test('rangeStockShopProductQuantityDiff x2 closing included', () async {
      final d = await testClosingsStore
          .addAllClosingStockShops(ClosingStockShop.dummyMar);
      expect(d.isNotEmpty, isTrue);
      final t = testClosingsStore.stockShopProductDiffTimeRange(
        ['pierre_entrepot'],
        1,
        WeebiDates.febStart,
        WeebiDates.marEnd,
      ).value;
      expect(t, 5.0);
    });
  });
}
