import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'snow_service.g.dart';

mixin SnowService on IntegrationService<List<SnowState>> {
  static const Duration min = Duration(hours: 1);
  static const Duration max = Duration(hours: 24);
  static const Duration period = Duration(seconds: 5);

  /// Get [SnowState] for given [location] from [Snow] integrations
  Future<Optional<SnowState>> getState(String location, [Duration? ttl = min]);

  /// Get cached [SnowState] for given [location]
  Optional<SnowState> getStateCached(String location, [String? cacheKey]);

  /// Get a stream of [SnowState]s periodically
  /// pulled from [getState] for given [location].
  Stream<SnowState> getStateAsStream(
    String location, {
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  });

  /// Get all [SnowState]s
  Future<Optional<List<SnowState>>> getStates([Duration? ttl = min]);

  /// Get all [SnowState]s from [cache]
  Optional<List<SnowState>> getStatesCached();

  /// Get a stream of all [SnowState]s periodically pulled from [getStates].
  Stream<List<SnowState>> getStatesAsStream({
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  });
}

/// Build a new [SnowService] instance.
@Riverpod(keepAlive: true)
Future<SnowService> snowService(SnowServiceRef ref, String baseUrl) async {
  if (baseUrl.isLocalhost) {
    final service = SnowConsumerService(ref, baseUrl);
    await service.build();
    return service;
  }
  return SnowDriverService(ref);
}
