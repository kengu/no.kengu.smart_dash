import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return account.value.firstWhere(key);
    }, ttl: ttl);
  }

  Optional<List<SnowState>> getStatesCached() {
    return _cache.get('states');
  }

  Future<Optional<List<SnowState>>> getStates({
    Duration ttl = const Duration(minutes: 5),
  }) async {
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
      ttl: ttl,
    );
    if (states.isPresent) {
      _cache.setTTL(
        'states',
        SnowState.toEarliestNextUpdate(states.value),
      );
    }
    return states;
  }
}

@Riverpod(keepAlive: true)
SnowService snowService(SnowServiceRef ref) => SnowService(ref);
