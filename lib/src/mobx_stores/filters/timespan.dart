// Package imports:
import 'package:mobx/mobx.dart';

@observable
class Timespan {
  final String _range;
  const Timespan._(this._range);

  @override
  String toString() => _range;

  static const Timespan day = Timespan._('day');
  static const Timespan month = Timespan._('month');
  static const Timespan range = Timespan._('range');
  static const Timespan full = Timespan._('full');
  static const Timespan unknown = Timespan._('');

  static Timespan tryParse(String val) {
    switch (val) {
      case 'day':
        return Timespan.day;
      case 'month':
        return Timespan.month;
      case 'range':
        return Timespan.range;
      case 'full':
        return Timespan.full;
      default:
        print('$val is not a valid Timespan');
        return Timespan.unknown;
    }
  }
}
