import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/utils.dart';
import 'package:test/test.dart';

Future main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;
  group('test closing stocks', () {
    test('', () async {
      await testClosingsStore.addAllClosingRanges([ClosingRange.dummyFeb]);
      await testClosingsStore.addAllClosingStocks([ClosingStock.dummy]);
      final t = testClosingsStore
          .stockProductFinalQuantity(1, end: WeebiDates.febEnd)
          .value;
      expect(t, 5.0);
    });
  });
}
