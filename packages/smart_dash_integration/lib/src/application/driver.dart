import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

typedef DriverBuilder<T extends Driver<T>> = T Function(ServiceConfig config);

abstract class Driver<T extends Driver<T>> {
  Driver({
    required this.ref,
    required this.key,
    required this.config,
  });

  final Ref ref;

  /// Get [Integration.key] of this [Driver]
  final String key;

  /// [Service] configuration for this driver
  final ServiceConfig config;
}
