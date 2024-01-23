import 'package:timeago/timeago.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeX on DateTime {
  bool get isThisSecond {
    final now = DateTime.now();
    return now.year == year &&
        now.month == month &&
        now.day == day &&
        now.hour == hour &&
        now.minute == minute &&
        now.second == second;
  }

  bool get isThisMinute {
    final now = DateTime.now();
    return now.year == year &&
        now.month == month &&
        now.day == day &&
        now.minute == minute &&
        now.hour == hour;
  }

  bool get isThisHour {
    final now = DateTime.now();
    return now.year == year &&
        now.month == month &&
        now.day == day &&
        now.hour == hour;
  }

  bool get isYesterday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day - 1 == day;
  }

  /// Check if this [DateTime] is today
  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool get isTomorrow {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day + 1 == day;
  }

  /// Check if this [DateTime] is this month
  bool get isThisMonth {
    final now = DateTime.now();
    return now.year == year && now.month == month;
  }

  /// Check if this [DateTime] is this month
  bool get isThisYear {
    return DateTime.now().year == year;
  }

  /// Get first day of this [DateTime] month
  DateTime get firstInMonth => DateTime(year, month, 1);

  /// Get [DateTime] at coordinate position given by [index]
  DateTime tsAt(int index, Duration duration, [bool end = true]) =>
      add(Duration(
        microseconds: duration.inMicroseconds * (index + (end ? 1 : 0)),
      ));

  /// Get coordinate index at given timestamp [ts].
  int indexAt(DateTime ts, Duration duration, [bool end = true]) {
    final delta = ts.difference(this).inMilliseconds;
    final raw = delta / duration.inMilliseconds;
    return end ? raw.ceil() : raw.floor();
  }

  /// Formats this [DateTime] to a fuzzy time like 'a moment ago'
  String format({
    DateTime? clock,
    String locale = 'en',
    String prefixAgo = '-',
    bool allowFromNow = false,
  }) {
    timeago.setLocaleMessages(
      locale,
      TimeAgoMessages(this, prefixAgo),
    );
    return timeago.format(
      this,
      clock: clock,
      locale: locale,
      allowFromNow: allowFromNow,
    );
  }

  /// Return DateTime with time set to 00:00:00
  DateTime toDate() => DateTime(year, month, day);
}

class TimeAgoMessages implements LookupMessages {
  const TimeAgoMessages(this.now, String prefixAgo) : _prefixAgo = prefixAgo;

  final DateTime now;

  final String _prefixAgo;

  @override
  String prefixAgo() => _prefixAgo;
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) => '${minutes}m';
  @override
  String hours(int hours) => '${hours}h';
  @override
  String aDay(int hours) => '${hours}h';
  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '${days}d';
  @override
  String months(int months) => '${months}mo';
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}
