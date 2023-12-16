import 'dart:async';

extension StreamX<T> on Stream<T> {
  /// Ensure that each event is not emitted faster than delay given
  Stream<T> delayed(Duration delay) async* {
    await for (final event in this) {
      yield event;
      await Future.delayed(delay);
    }
  }
}
