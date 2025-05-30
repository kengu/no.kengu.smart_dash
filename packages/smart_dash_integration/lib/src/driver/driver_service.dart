import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

/// Base class for implementing [IntegrationType] integrations.
abstract class DriverService<
    D,
    E extends DriverDataEvent<D>,
    T extends Driver<T>,
    M extends DriverManager<T>> extends IntegrationService<D> {
  DriverService(super.ref, super.type, this.cache);

  /// Cache for caching results
  @protected
  final FutureCache cache;

  @protected
  Logger get log => Logger('$runtimeType');

  /// Get [DriverManager] of [Driver] instances of type [T]
  M get manager;

  /// Get list of registered [Integration]s
  @override
  List<Integration> get integrations => manager.integrations;

  /// Get stream of driver events
  Stream<DriverEvent> get events => manager.events;

  /// Get all [ServiceConfig] for [Driver]s
  List<ServiceConfig> get configs => manager.configs;

  /// Get first [ServiceConfig] matching [key] and [id] if given
  Optional<ServiceConfig> firstConfig(String key, [String? id]) {
    return manager.firstConfig(key, id);
  }

  /// Get stream of data of type [D] updates from drivers.
  ///
  /// This helper method is equivalent to
  /// ```dart
  /// service.manager.events.whereType<E>().map((e) => e.data)
  /// ```
  Stream<D> get updates => manager.events.whereType<E>().map((e) => e.data);
}
