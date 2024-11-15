import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/feature/snow/data/snow_client.dart';
import 'package:smart_dash_app/feature/snow/domain/snow_state.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class SnowService {
  static const ttl = Duration(hours: 1);

  SnowService(this.key, this.ref);

  final Ref ref;

  final String key;

  final _cache = FutureCache(prefix: '$SnowService');

  final StreamController<List<SnowState>> _updates =
      StreamController.broadcast();

  Stream<List<SnowState>> get updates => _updates.stream;

  Future<Optional<SnowState>> getState(
    String location, {
    Duration? ttl = ttl,
  }) async {
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

  Future<Optional<List<SnowState>>> getStates({
    Duration? ttl = ttl,
  }) async {
    final states = await _cache.getOrFetch(
      'states',
      () async {
        final config = await _getConfig();
        if (config.isPresent) {
          final client = newClient(config.value);
          final states = await client.getStates();
          for (final state in states) {
            _updates.add(state);
          }
          return states;
        }
        return const Optional<List<SnowState>>.empty();
      },
      ttl: ttl?.clamp(
        ttl,
        const Duration(days: 1),
      ),
    );

    /*
    if (states.isPresent) {
      _cache.setTTL(
        'states',
        SnowState.toEarliestNextUpdate(
          states.value,
          limit: SnowService.ttl,
        ),
      );
    }
    */
    return states;
  }

  Future<Optional<ServiceConfig>> _getConfig(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('config', () async {
      final home = await ref.read(accountServiceProvider).getCurrentHome();
      if (!home.isPresent) return const Optional.empty();
      return home.value.firstServiceWhere(key);
    }, ttl: ttl);
  }

  SnowClient newClient(ServiceConfig config);
}
