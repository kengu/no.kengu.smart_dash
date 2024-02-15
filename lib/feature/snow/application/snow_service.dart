import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/snow/data/nysny_client.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/util/future.dart';

part 'snow_service.g.dart';

class SnowService {
  SnowService(this.ref) {
    ref.onDispose(() {
      _api.close(force: true);
    });
  }

  static const key = 'nysny';

  final Ref ref;

  final _cache = FutureCache(prefix: '$SnowService');

  final _api = Dio(BaseOptions(baseUrl: 'https://nysny.no/'))
    // Process json in the background
    ..transformer = BackgroundTransformer();

  Optional<Optional<ServiceConfig>> getCachedConfigs() {
    return _cache.get('configs');
  }

  Future<Optional<ServiceConfig>> getConfig(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('config', () async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account = await ref.read(accountRepositoryProvider).get(
            user.userId,
          );
      // TODO: Implement selected home provider
      final home = account.value.homes?.firstOrNull;
      if (home == null) return const Optional.empty();
      return home.firstServiceWhere(key);
    }, ttl: ttl);
  }

  Future<Optional<SnowState>> getState(String location, {Duration? ttl}) async {
    final config = await getConfig();
    if (!config.isPresent) return const Optional.empty();
    final states = await getStates(ttl: ttl);
    if (states.isPresent) {
      return states.value.firstWhereOptional((e) => e.location == location);
    }
    return const Optional.empty();
  }

  Optional<SnowState> getStateCached(String location) {
    final states = _cache.get<List<SnowState>>('states');
    if (states.isPresent) {
      return states.value.firstWhereOptional((e) => e.location == location);
    }
    return const Optional.empty();
  }

  Optional<List<SnowState>> getStatesCached() {
    return _cache.get('states');
  }

  Future<Optional<List<SnowState>>> getStates({Duration? ttl}) async {
    final config = await getConfig();
    if (!config.isPresent) return const Optional.empty();
    final states = await _cache.getOrFetch(
      'states',
      NySnyClient(
          _api,
          NySnyCredentials(
            email: config.value.username,
            password: config.value.password,
          )).getStates,
      ttl: ttl?.clamp(
        const Duration(minutes: 5),
        const Duration(days: 1),
      ),
    );

    if (states.isPresent) {
      _cache.setTTL(
        'states',
        SnowState.toEarliestNextUpdate(
          states.value,
          limit: const Duration(minutes: 5),
        ),
      );
    }
    return states;
  }
}

@Riverpod(keepAlive: true)
SnowService snowService(SnowServiceRef ref) => SnowService(ref);
