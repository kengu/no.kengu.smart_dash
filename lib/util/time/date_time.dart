import 'package:timeago/timeago.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeX on DateTime {
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
    bool allowFromNow = false,
  }) {
    timeago.setLocaleMessages(locale, TimeAgoMessages(this));
    return timeago.format(
      this,
      clock: clock,
      locale: locale,
      allowFromNow: allowFromNow,
    );
  }
}

class TimeAgoMessages implements LookupMessages {
  const TimeAgoMessages(this.now);

  final DateTime now;

  @override
  String prefixAgo() => '-';
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
