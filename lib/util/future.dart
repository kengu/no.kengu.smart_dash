import 'dart:math';

import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:optional/optional.dart';

import 'guard.dart';

class FutureCache {
  FutureCache({required this.prefix});

  final String prefix;

  final Map<String, dynamic> _results = {};
  final Map<String, (DateTime, Future?)> _requests = {};

  bool contains(String key) {
    final value = _results[key];
    if (value is Optional) {
      return value.isPresent;
    }
    return value != null;
  }

  Optional<T> get<T>(String key) {
    final value = _results[key];
    if (value is Optional<T>) {
      //debugPrint('get($prefix:$key)=>FOUND');
      return value;
    }
    //debugPrint('get($prefix:$key)=>EMPTY');
    return Optional<T>.ofNullable(_results[key]);
  }

  void set<T>(String key, Optional<T> value) {
    _results[key] = value;
    _requests[key] = (DateTime.now(), Future.value(value));
    //debugPrint('set($prefix:$key)');
  }

  void setTTL(String key, DateTime when) {
    if (_requests.containsKey(key)) {
      final item = _requests[key]!;
      _requests[key] = (when, item.$2);
      //debugPrint('setTTL($prefix:$key)');
    }
  }

  Optional<DateTime> lastCached(String key) {
    return Optional.ofNullable(_requests[key]?.$1);
  }

  Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetch, {
    Duration? ttl = Duration.zero,
  }) async {
    final now = DateTime.now();
    final cached = _requests[key];
    if (cached != null && !isExpired(now, cached.$1, ttl)) {
      return _results[key] ?? cached.$2;
    }

    final request = guard(fetch);
    _requests[key] = (now, request);

    final result = await request;

    _results[key] = result;
    _requests[key] = (now, Future.value(result));

    if (ttl == Duration.zero) {
      _requests.remove(key);
      _results.remove(key);
    }

    //debugPrint('getOrFetch($prefix:$key,$ttl)');

    return result;
  }

  bool isExpired(DateTime now, DateTime cached, Duration? ttl) =>
      ttl != null && now.difference(cached) > ttl;
}
