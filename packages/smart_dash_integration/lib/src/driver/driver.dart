import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

typedef DriverBuilder<T extends Driver<T>> = T Function(ServiceConfig config);

abstract class Driver<T extends Driver<T>> {
  Driver({
    required this.ref,
    required this.key,
    required this.type,
    required this.config,
  }) : _lastEvent = DriverInitializedEvent.now(key) {
    ref.onDispose(dispose);
  }

  final Ref ref;

  /// Get [Integration.key] of this [Driver]
  final String key;

  /// Get [Integration.type] of this [Driver]
  final IntegrationType type;

  /// [Service] configuration for this driver
  final ServiceConfig config;

  final StreamController<DriverEvent> _controller =
      StreamController.broadcast();

  Stream<DriverEvent> get events => _controller.stream;

  /// It updated on each [raise]
  DriverEvent _lastEvent;

  /// Check when driver last updated devices.
  DriverEvent get lastEvent => _lastEvent;

  @protected
  @mustCallSuper
  void failed(Object error) {
    raise(
      DriverFailureEvent(
        error,
        key: config.key,
        when: DateTime.now(),
        last: _lastEvent.last,
      ),
    );
  }

  @protected
  DriverEvent raise(DriverEvent event) {
    if (isDisposed) {
      Logger('$runtimeType').fine(
        'Driver [$key] is disposed: '
        'skipped [${event.runtimeType}]',
      );
      return event;
    }
    _lastEvent = event;
    _controller.add(event);
    return event;
  }

  /// Check if this driver is disposed
  bool get isDisposed => _controller.isClosed;

  @protected
  @mustCallSuper
  Future<void> dispose() {
    Logger('$runtimeType').fine('Driver [$key] was disposed');
    raise(
      DriverDisposedEvent.now(key),
    );
    return _controller.close();
  }
}

abstract class DriverEvent {
  const DriverEvent({
    required this.key,
    required this.last,
    required this.when,
  });

  final String key;
  final DateTime last;
  final DateTime when;

  Duration get duration => when.difference(last);
}

abstract class DriverDataEvent<D> extends DriverEvent {
  const DriverDataEvent(
    this.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  final D data;
}

class DriverInitializedEvent extends DriverEvent {
  const DriverInitializedEvent(
      {required super.key, required super.last, required super.when});

  factory DriverInitializedEvent.now(String key) {
    final when = DateTime.now();
    return DriverInitializedEvent(key: key, when: when, last: when);
  }
}

class DriverDisposedEvent extends DriverEvent {
  const DriverDisposedEvent(
      {required super.key, required super.last, required super.when});

  factory DriverDisposedEvent.now(String key) {
    final when = DateTime.now();
    return DriverDisposedEvent(key: key, when: when, last: when);
  }
}

class DriverFailureEvent extends DriverEvent {
  const DriverFailureEvent(
    this.error, {
    required super.key,
    required super.last,
    required super.when,
  });
  final Object error;
}
