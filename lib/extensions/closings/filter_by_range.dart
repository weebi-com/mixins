import 'package:models_weebi/closings.dart';

extension FilterByRange<C extends ClosingRangeAbstract> on Iterable<C> {
  Iterable<C> filterByRange(DateTime start, DateTime end) => where((e) =>
          e.closingRange.startDate.isAfter(start) ||
          e.closingRange.startDate.isAtSameMomentAs(start))
      .where((e) =>
          e.closingRange.endDate.isBefore(end) ||
          e.closingRange.endDate.isAtSameMomentAs(end));

  Iterable<C> filterByEndDate(DateTime end) => where((e) =>
      e.closingRange.endDate.isBefore(end) ||
      e.closingRange.endDate.isAtSameMomentAs(end));

  Iterable<C> filterByStartDate(DateTime start) => where((e) =>
      e.closingRange.startDate.isAfter(start) ||
      e.closingRange.startDate.isAtSameMomentAs(start));
}

extension FilterByClosingRange on Iterable<ClosingRange> {
  Iterable<ClosingRange> filterByClosingRangeRange(
          DateTime start, DateTime end) =>
      where((ClosingRange e) =>
              e.startDate.isAfter(start) || e.startDate.isAtSameMomentAs(start))
          .where((e) =>
              e.endDate.isBefore(end) || e.endDate.isAtSameMomentAs(end));

  Iterable<ClosingRange> filterByEndDate(DateTime end) =>
      where((e) => e.endDate.isBefore(end) || e.endDate.isAtSameMomentAs(end));

  Iterable<ClosingRange> filterByStartDate(DateTime start) =>
      where((ClosingRange e) =>
          e.startDate.isAfter(start) || e.startDate.isAtSameMomentAs(start));
}
