import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:models_weebi/closings.dart';

Future<String> createClosingRange(
  ClosingsStore closingsStore,
  DateTime startDate,
  DateTime endDate,
) async {
  final newClosingRange = ClosingRange(
    date: DateTime.now(),
    startDate: startDate,
    endDate: endDate,
  );
  print('newClosingRange');

  try {
    // final _createdClosing =
    await closingsStore.createClosingRange(newClosingRange);
    return '';
  } catch (e) {
    print(e);
    // showDialogWeebiNotOk('$e', context);
    return e.toString();
  }
}
