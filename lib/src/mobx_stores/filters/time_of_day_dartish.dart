// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library TimeOfDayDartDart;

// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

/// Whether the [TimeOfDayDart] is before or after noon.
enum DayPeriod {
  /// Ante meridiem (before noon).
  am,

  /// Post meridiem (after noon).
  pm,
}

/// A value representing a time during the day, independent of the date that
/// day might fall on or the time zone.
///
/// The time is represented by [hour] and [minute] pair. Once created, both
/// values cannot be changed.
///
/// You can create TimeOfDayDart using the constructor which requires both hour and
/// minute or using [DateTime] object.
/// Hours are specified between 0 and 23, as in a 24-hour clock.
///
/// {@tool snippet}
///
/// ```dart
/// TimeOfDayDart now = TimeOfDayDart.now();
/// const TimeOfDayDart releaseTime = TimeOfDayDart(hour: 15, minute: 0); // 3:00pm
/// TimeOfDayDart roomBooked = TimeOfDayDart.fromDateTime(DateTime.parse('2018-10-20 16:30:04Z')); // 4:30pm
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [showTimePicker], which returns this type.
///  * [MaterialLocalizations], which provides methods for formatting values of
///    this type according to the chosen [Locale].
///  * [DateTime], which represents date and time, and is subject to eras and
///    time zones.

class TimeOfDayDart {
  /// Creates a time of day.
  ///
  /// The [hour] argument must be between 0 and 23, inclusive. The [minute]
  /// argument must be between 0 and 59, inclusive.
  const TimeOfDayDart({required this.hour, required this.minute});

  /// Creates a time of day based on the given time.
  ///
  /// The [hour] is set to the time's hour and the [minute] is set to the time's
  /// minute in the timezone of the given [DateTime].
  TimeOfDayDart.fromDateTime(DateTime time)
      : hour = time.hour,
        minute = time.minute;

  /// Creates a time of day based on the current time.
  ///
  /// The [hour] is set to the current hour and the [minute] is set to the
  /// current minute in the local time zone.
  factory TimeOfDayDart.now() {
    return TimeOfDayDart.fromDateTime(DateTime.now());
  }

  /// The number of hours in one day, i.e. 24.
  static const int hoursPerDay = 24;

  /// The number of hours in one day period (see also [DayPeriod]), i.e. 12.
  static const int hoursPerPeriod = 12;

  /// The number of minutes in one hour, i.e. 60.
  static const int minutesPerHour = 60;

  /// Returns a new TimeOfDayDart with the hour and/or minute replaced.
  TimeOfDayDart replacing({int? hour, int? minute}) {
    assert(hour == null || (hour >= 0 && hour < hoursPerDay));
    assert(minute == null || (minute >= 0 && minute < minutesPerHour));
    return TimeOfDayDart(
        hour: hour ?? this.hour, minute: minute ?? this.minute);
  }

  /// The selected hour, in 24 hour time from 0..23.
  final int hour;

  /// The selected minute.
  final int minute;

  /// Whether this time of day is before or after noon.
  DayPeriod get period => hour < hoursPerPeriod ? DayPeriod.am : DayPeriod.pm;

  /// Which hour of the current period (e.g., am or pm) this time is.
  ///
  /// For 12AM (midnight) and 12PM (noon) this returns 12.
  int get hourOfPeriod => hour == 0 || hour == 12 ? 12 : hour - periodOffset;

  /// The hour at which the current period starts.
  int get periodOffset => period == DayPeriod.am ? 0 : hoursPerPeriod;

  /// Returns the localized string representation of this time of day.
  ///
  /// This is a shortcut for [MaterialLocalizations.TormattimeOfDayDart].
  // String format(BuildContext context) {
  //   assert(debugCheckHasMediaQuery(context));
  //   // assert(debugCheckHasMaterialLocalizations(context));
  //   // final MaterialLocalizations localizations =
  //   //     MaterialLocalizations.of(context);
  //   return localizations.TormattimeOfDayDart(
  //     this,
  //     alwaysUse24HourFormat: MediaQuery.of(context).alwaysUse24HourFormat,
  //   );
  // }

  @override
  bool operator ==(Object other) {
    return other is TimeOfDayDart &&
        other.hour == hour &&
        other.minute == minute;
  }

  @override
  int get hashCode => Object.hash(hour, minute);

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      if (value < 10) {
        return '0$value';
      }
      return value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hour);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$TimeOfDayDart($hourLabel:$minuteLabel)';
  }
}

/// A [RestorableValue] that knows how to save and restore [TimeOfDayDart].
///
/// {@macro flutter.widgets.RestorableNum}.
class TestorabletimeOfDayDart {
  /// Creates a [TestorabletimeOfDayDart].
  ///
  /// {@macro flutter.widgets.RestorableNum.constructor}
  TestorabletimeOfDayDart(TimeOfDayDart defaultValue)
      : _defaultValue = defaultValue;

  final TimeOfDayDart _defaultValue;

  TimeOfDayDart createDefaultValue() => _defaultValue;

  // @override
  // void didUpdateValue(TimeOfDayDart? oldValue) {
  //   assert(debugIsSerializableForRestoration(value.hour));
  //   assert(debugIsSerializableForRestoration(value.minute));
  //   notifyListeners();
  // }

  TimeOfDayDart fromPrimitives(Object? data) {
    final List<Object?> timeData = data! as List<Object?>;
    return TimeOfDayDart(
      minute: timeData[0]! as int,
      hour: timeData[1]! as int,
    );
  }

  // @override
  // Object? toPrimitives() => <int>[value.minute, value.hour];
}

/// Determines how the time picker invoked using [showTimePicker] formats and
/// lays out the time controls.
///
/// The time picker provides layout configurations optimized for each of the
/// enum values.
enum TimeOfDayDartFormat {
  /// Corresponds to the ICU 'HH:mm' pattern.
  ///
  /// This format uses 24-hour two-digit zero-padded hours. Controls are always
  /// laid out horizontally. Hours are separated from minutes by one colon
  /// character.
  HH_colon_mm,

  /// Corresponds to the ICU 'HH.mm' pattern.
  ///
  /// This format uses 24-hour two-digit zero-padded hours. Controls are always
  /// laid out horizontally. Hours are separated from minutes by one dot
  /// character.
  HH_dot_mm,

  /// Corresponds to the ICU "HH 'h' mm" pattern used in Canadian French.
  ///
  /// This format uses 24-hour two-digit zero-padded hours. Controls are always
  /// laid out horizontally. Hours are separated from minutes by letter 'h'.
  frenchCanadian,

  /// Corresponds to the ICU 'H:mm' pattern.
  ///
  /// This format uses 24-hour non-padded variable-length hours. Controls are
  /// always laid out horizontally. Hours are separated from minutes by one
  /// colon character.
  H_colon_mm,

  /// Corresponds to the ICU 'h:mm a' pattern.
  ///
  /// This format uses 12-hour non-padded variable-length hours with a day
  /// period. Controls are laid out horizontally in portrait mode. In landscape
  /// mode, the day period appears vertically after (consistent with the ambient
  /// [TextDirection]) hour-minute indicator. Hours are separated from minutes
  /// by one colon character.
  h_colon_mm_space_a,

  /// Corresponds to the ICU 'a h:mm' pattern.
  ///
  /// This format uses 12-hour non-padded variable-length hours with a day
  /// period. Controls are laid out horizontally in portrait mode. In landscape
  /// mode, the day period appears vertically before (consistent with the
  /// ambient [TextDirection]) hour-minute indicator. Hours are separated from
  /// minutes by one colon character.
  a_space_h_colon_mm,
}

/// Describes how hours are formatted.
enum HourFormat {
  /// Zero-padded two-digit 24-hour format ranging from "00" to "23".
  HH,

  /// Non-padded variable-length 24-hour format ranging from "0" to "23".
  H,

  /// Non-padded variable-length hour in day period format ranging from "1" to
  /// "12".
  h,
}

/// The [HourFormat] used for the given [TimeOfDayDartFormat].
HourFormat hourFormat({required TimeOfDayDartFormat of}) {
  switch (of) {
    case TimeOfDayDartFormat.h_colon_mm_space_a:
    case TimeOfDayDartFormat.a_space_h_colon_mm:
      return HourFormat.h;
    case TimeOfDayDartFormat.H_colon_mm:
      return HourFormat.H;
    case TimeOfDayDartFormat.HH_dot_mm:
    case TimeOfDayDartFormat.HH_colon_mm:
    case TimeOfDayDartFormat.frenchCanadian:
      return HourFormat.HH;
  }
}
