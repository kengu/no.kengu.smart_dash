import 'dart:math';

import 'package:smart_dash_analytics/smart_dash_analytics.dart';

extension DurationX on Duration {
  TimeScale to() => TimeScale.from(this);

  Duration nice([int factor = 4]) {
    final years = /* base: 1 year = 31536000 seconds */
        _tryNice(factor, inSeconds, 31536000, const [100, 100, 10, 5, 2, 1]);

    if (years > 0) {
      return Duration(days: years * 365);
    }

    final months = /* base: 1 month = 2592000 seconds */
        _tryNice(factor, inSeconds, 2592000, const [6, 2, 1]);

    if (months > 0) {
      return Duration(days: months * 30);
    }

    final days = /* base: 1 day = 86400 seconds */
        _tryNice(factor, inSeconds, 86400, const [14, 7, 2, 1]);

    if (days > 0) {
      return Duration(days: days);
    }

    final hours = /* base: 1 hour = 3600 seconds */
        _tryNice(factor, inSeconds, 3600, const [12, 6, 2, 1]);

    if (hours > 0) {
      return Duration(hours: hours);
    }

    final minutes = /* base: 1 minute = 60 seconds */
        _tryNice(factor, inSeconds, 60, const [30, 15, 10, 5, 1]);

    if (minutes > 0) {
      return Duration(minutes: minutes);
    }

    final seconds = /* base: 1 second = 60 seconds */
        _tryNice(factor, inSeconds, 1, const [30, 15, 10, 5, 1]);

    if (seconds > 0) {
      return Duration(seconds: seconds);
    }

    final millis = /* base: 1 millisecond = 1/1000 second */
        _tryNice(factor, inSeconds * 1000, 1, const [100, 10, 1]);

    if (millis > 0) {
      return Duration(milliseconds: millis);
    }

    final micros = /* base: 1 microsecond = 1/1000000 second */
        _tryNice(factor, inSeconds * 1000000, 1, const [100, 10, 1]);

    return Duration(microseconds: micros);
  }

  int _tryNice(int factor, int steps, double base, List<int> multiples) {
    for (final multiple in multiples) {
      final span = (steps / (multiple * base)).floor();

      if (span >= factor) {
        return multiple;
      }
    }
    return 0;
  }

  int steps([TimeScale? scale, int min = 1]) {
    scale = scale ?? to();
    switch (scale) {
      case TimeScale.any:
      case TimeScale.micros:
        return max(min, inMicroseconds);
      case TimeScale.millis:
        return max(min, inMilliseconds);
      case TimeScale.seconds:
        return max(min, inSeconds);
      case TimeScale.minutes:
        return max(min, inMinutes);
      case TimeScale.hours:
        return max(min, inHours);
      case TimeScale.days:
        return max(min, inDays);
      case TimeScale.months:
        return max(min, inDays ~/ 30);
      case TimeScale.years:
        return max(min, inDays ~/ 365);
    }
  }

  bool isWithin(TimeScale scale, Duration span) {
    if ((this - span).isNegative) {
      return false;
    }
    switch (scale) {
      case TimeScale.any:
        return true;
      case TimeScale.micros:
        return span.inMicroseconds < inMicroseconds;
      case TimeScale.millis:
        return span.inMilliseconds < inMilliseconds;
      case TimeScale.seconds:
        return span.inSeconds < inSeconds;
      case TimeScale.minutes:
        return span.inMinutes < inMinutes;
      case TimeScale.hours:
        return span.inHours < inHours;
      case TimeScale.days:
      case TimeScale.months:
      case TimeScale.years:
        return span.inDays < inDays;
    }
  }

  bool isOutside(TimeScale scale, Duration span) {
    if ((span - this).isNegative) {
      return false;
    }
    switch (scale) {
      case TimeScale.any:
        return true;
      case TimeScale.micros:
        return span.inMicroseconds > inMicroseconds;
      case TimeScale.millis:
        return span.inMilliseconds > inMilliseconds;
      case TimeScale.seconds:
        return span.inSeconds > inSeconds;
      case TimeScale.minutes:
        return span.inMinutes > inMinutes;
      case TimeScale.hours:
        return span.inHours > inHours;
      case TimeScale.days:
      case TimeScale.months:
      case TimeScale.years:
        return span.inDays > inDays;
    }
  }
}
