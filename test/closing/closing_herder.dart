import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart';
import 'package:test/test.dart';

Future main() async {
  final testClosingsStore = ClosingsStoreInstantiater.noPersistence;
  group('test closings herder ', () {
    test('herder purchasing power', () async {
      await testClosingsStore
          .addAllClosingLedgerHerders([ClosingLedgerHerder.dummyFeb]);
      final _temp = testClosingsStore.herderLastBalance(
        '1',
      );
      expect(_temp, -20);
    });
  });
}
