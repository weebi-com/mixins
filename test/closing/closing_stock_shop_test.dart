import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/utils.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;
  group('test closing stock shops', () {
    test('rangeStockShopProductQuantityDiff x1 closing', () async {
      await testClosingsStore.addAllClosingRanges([ClosingRange.dummyFeb]);
      await testClosingsStore
          .addAllClosingStockShops(ClosingStockShop.dummyFeb);
      final t = testClosingsStore.stockShopProductDiffTimeRange(
        ['pierre_entrepot'],
        1,
        WeebiDates.febStart,
        WeebiDates.febEnd,
      ).value;
      expect(t, 3.0);
    });
    test('rangeStockShopProductQuantityDiff x2 closing included', () async {
      await testClosingsStore
          .addAllClosingStockShops(ClosingStockShop.dummyMar);
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
