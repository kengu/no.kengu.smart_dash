import 'dart:async';

import 'package:async/async.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional_internal.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

typedef ServiceConfigGetter = Iterable<ServiceConfig> Function(String key);

abstract class DriverManager<T extends Driver<T>> {
  DriverManager(this.ref);

  final Ref ref;

  Logger get _log => Logger('$runtimeType');

  final Map<ServiceConfig, T> _drivers = {};
  final Map<String, DriverBuilder<T>> _builders = {};

  Stream<DriverEvent> get events {
    return StreamGroup.merge(
      _drivers.values.map((e) => e.events),
    );
  }

  /// Check if a [Driver] of type [T] for given [ServiceConfig] exists
  bool exists(ServiceConfig config) =>
      _drivers.keys.any((e) => _match(e, config.key, config.id));

  /// Find [ServiceConfig] for [WeatherForecastDriver] with given [Integration.key]
  Optional<ServiceConfig> firstConfig(String key, [String? id]) {
    return configs.where((e) => _match(e, key, id)).firstOptional;
  }

  /// Find a [Driver] of type [T] for given [ServiceConfig]
  Optional<T> firstDriver(ServiceConfig config) {
    return drivers
        .where((e) => _match(e.config, config.key, config.id))
        .firstOptional;
  }

  bool _match(ServiceConfig test, String key, String? id) =>
      test.key == key && (id == null || test.id == id);

  /// Register [builder] for driver [T] before calling [build]
  void register(
    String key,
    DriverBuilder<T> builder,
  ) {
    _builders[key] = builder;
    _log.fine(
      'Builder for $T[key: $key] registered',
    );
  }

  /// Build driver [T] for [ServiceConfig] returned by [where]
  @mustCallSuper
  void build(ServiceConfigGetter where) {
    if (_builders.isEmpty) {
      _log.fine(
        'Nothing to build (drivers installed: ${_drivers.length})',
      );
      return;
    }
    final builders = <String, Iterable<ServiceConfig>>{};
    for (final it in _builders.entries) {
      builders[it.key] = where(it.key);
    }
    for (final it in builders.entries) {
      final builder = _builders[it.key];
      assert(
        builder != null,
        '$DriverBuilder for $T[${it.key}] '
        'not found. Did you forget to register a builder for it?',
      );
      for (final config in it.value) {
        _drivers[config] = builder!(config);
      }
      _log.fine(
        'Drivers installed: ${builders.length} (total: ${_drivers.length})',
      );
    }

    // Reset to show it
    _builders.clear();
  }

  List<T> get drivers {
    return _drivers.values.toList();
  }

  List<ServiceConfig> get configs {
    return _drivers.values.map((e) => e.config).toList();
  }

  /// Get driver [T] for given service [config]
  T get(ServiceConfig config) {
    assert(
      exists(config),
      'Driver $T[key: ${config.key}] not found. '
      'Have you remembered to register it?',
    );
    return _drivers.entries
        .firstWhereOptional((it) => _match(it.key, config.key, config.id))
        .value
        .value;
  }
}
