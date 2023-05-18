import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart' show ClosingRange;
import 'package:test/test.dart';

void main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;

  group('closing_ranges', () {
    test('json', () async {
      final _json = ClosingRange.dummyFeb.toJson();
      print(_json);
      final _dummyFeb = ClosingRange.fromJson(_json);
      expect(_dummyFeb == ClosingRange.dummyFeb, isTrue);
    });
    test('addAll', () async {
      await testClosingsStore
          .addAllClosingRanges([ClosingRange.dummyFeb, ClosingRange.dummyMar]);
      expect(testClosingsStore.closingRanges.length, 2);
    });
    test('delete', () async {
      final d =
          await testClosingsStore.deleteClosingRange(ClosingRange.dummyMar);
      expect(d.length, 1);
      final dd =
          await testClosingsStore.deleteClosingRange(ClosingRange.dummyFeb);
      expect(dd.length, 0);
    });
  });
}
