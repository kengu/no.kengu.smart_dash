extension DurationX on Duration {
  /// Returns clamp of [Duration] between [min] and [max].
  Duration clamp(Duration min, Duration max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}
