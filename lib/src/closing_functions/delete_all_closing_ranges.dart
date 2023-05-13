import 'package:mixins_weebi/mobx_store_closing.dart';

Future<String> deleteAllClosingRanges(ClosingsStore closingsStore) async {
  for (final c in closingsStore.closingRanges.toList()) {
    try {
      await closingsStore.deleteClosingRange(c);
    } catch (e) {
      print(e);
      return '$e';
    }
  }
  return '';
}
