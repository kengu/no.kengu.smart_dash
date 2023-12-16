import 'dart:math' as math;

enum TimeScale {
  any,
  micros,
  millis,
  seconds,
  minutes,
  hours,
  days,
  months,
  years;

  bool get isMicro => this == micros;
  bool get isMilli => this == millis;
  bool get isSeconds => this == seconds;
  bool get isMinutes => this == minutes;
  bool get isHours => this == hours;
  bool get isDays => this == days;
  bool get isMonths => this == months;
  bool get isYears => this == years;

  int multiplier([int steps = 1]) {
    switch (this) {
      case TimeScale.any:
        return 1;
      case TimeScale.micros:
        return 1000;
      case TimeScale.millis:
        return 1000;
      case TimeScale.seconds:
        return 60;
      case TimeScale.minutes:
        return 60;
      case TimeScale.hours:
        return 24;
      case TimeScale.days:
        return 30;
      case TimeScale.months:
        return 12;
      case TimeScale.years:
        return 265;
    }
  }

  static TimeScale from(Duration duration) {
    if (duration.inMilliseconds < 1) {
      return micros;
    }
    if (duration.inSeconds < 1) {
      return micros;
    }
    if (duration.inMinutes < 1) {
      return seconds;
    }
    if (duration.inMinutes < 1) {
      return seconds;
    }
    if (duration.inHours < 1) {
      return minutes;
    }
    if (duration.inDays < 1) {
      return hours;
    }
    if (duration.inDays < 31) {
      return days;
    }
    if (duration.inDays < 365) {
      return months;
    }
    return years;
  }

  TimeScale max() => values[0];
  TimeScale min() => values[0];
  TimeScale up() => values[math.max(0, index + 1)];
  TimeScale down() => values[math.max(0, index - 1)];

  Duration to([
    int span = 1,
    Duration any = Duration.zero,
  ]) {
    switch (this) {
      case TimeScale.any:
        return any;
      case TimeScale.micros:
        return Duration(microseconds: span);
      case TimeScale.millis:
        return Duration(milliseconds: span);
      case TimeScale.seconds:
        return Duration(seconds: span);
      case TimeScale.minutes:
        return Duration(minutes: span);
      case TimeScale.hours:
        return Duration(hours: span);
      case TimeScale.days:
        return Duration(days: span);
      case TimeScale.months:
        return Duration(days: 30 * span);
      case TimeScale.years:
        return Duration(days: 365 * span);
    }
  }
}
