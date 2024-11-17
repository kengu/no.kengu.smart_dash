import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

typedef ServiceConfigGetter = Iterable<ServiceConfig> Function(String key);

abstract class DriverManager<T extends Driver<T>> {
  DriverManager(this.ref);

  final Ref ref;

  Logger get _log => Logger('$runtimeType');

  final Map<ServiceConfig, T> _drivers = {};
  final Map<String, DriverBuilder<T>> _builders = {};

  /// Check if a [Driver] of type [T] for given [ServiceConfig] exists
  bool exists(ServiceConfig config) => _drivers.containsKey(config);

  /// Register [builder] for driver [T] before calling [build]
  void register(
    String key,
    DriverBuilder<T> builder,
  ) {
    assert(
      _builders[key] == null,
      'Builder for $T[key: $key] exists already',
    );

    _builders[key] = builder;
    _log.fine(
      'Builder for $T[key: $key] registered',
    );
  }

  /// Build driver [T] for [ServiceConfig] returned by [where]
  Future<void> build(ServiceConfigGetter where) {
    return guard(
      () async {
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
        }
      },
      task: 'build()',
      name: '$runtimeType',
    );
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
    return _drivers[config] as T;
  }
}
