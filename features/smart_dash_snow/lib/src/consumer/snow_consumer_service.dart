import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/consumer/snow_consumer_client.dart';
import 'package:stream_transform/stream_transform.dart';

/// A [IntegrationConsumerService] for [SnowState].
final class SnowConsumerService
    extends IntegrationConsumerService<List<SnowState>> with SnowService {
  SnowConsumerService(Ref ref, String baseUrl)
      : super(ref, IntegrationType.snow, baseUrl);

  /// [FutureCache] of service results.
  final cache = FutureCache(prefix: '$SnowService');

  @override
  Future<void> build() async {
    await super.build();
    final repo = ref.read(snowStateRepositoryProvider);
    // Populate FutureCache with values from
    // persistent storage. If will return cached
    // value on client errors that are not fatal.
    for (final it in await repo.getAll()) {
      cache.set('state:${it.location}', Optional.of(it));
    }
  }

  /// Get [SnowState] for given [location] from [Snow] integrations
  @override
  Future<Optional<SnowState>> getState(
    String location, [
    Duration? ttl = SnowService.min,
  ]) async {
    return cache.getOrFetch(
      'state:$location',
      () async {
        final client = ref.read(
          snowConsumerClientProvider(baseUrl),
        );
        return await client.get(location);
      },
      ttl: ttl?.clamp(ttl, SnowService.max),
    );
  }

  /// Get cached [SnowState] for given [location]
  @override
  Optional<SnowState> getStateCached(String location, [String? cacheKey]) {
    return cache.get<SnowState>('state:${cacheKey ?? location}');
  }

  /// Get a stream of [SnowState]s periodically
  /// pulled from [getState] for given [location].
  @override
  Stream<SnowState> getStateAsStream(
    String location, {
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  }) async* {
    // TODO: Implement SnowConsumerClient.getStateAsStream
    if (refresh) {
      final state = await getState(location);
      if (state.isPresent) {
        yield state.value;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(SnowService.min, max))
        .asyncMap((e) => getState(location))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  /// Get all [SnowState]s
  @override
  Future<Optional<List<SnowState>>> getStates([
    Duration? ttl = SnowService.min,
  ]) async {
    // TODO: Collect states from individual cache items
    return cache.getOrFetch('states', () async {
      final client = ref.read(
        snowConsumerClientProvider(baseUrl),
      );
      final states = await client.getAll();
      return Optional.of(states);
    }, ttl: ttl?.clamp(SnowService.period, SnowService.max));
  }

  /// Get all [SnowState]s from [cache]
  @override
  Optional<List<SnowState>> getStatesCached() {
    return cache.get<List<SnowState>>('states');
  }

  /// Get a stream of all [SnowState]s periodically pulled from [getStates].
  @override
  Stream<List<SnowState>> getStatesAsStream({
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  }) async* {
    // TODO: Implement SnowConsumerClient.getStatesAsStream
    if (refresh) {
      final result = await getStates(period);
      if (result.isPresent) {
        yield result.value;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(SnowService.min, max))
        .asyncMap((e) => getStates(SnowService.min))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }
}
