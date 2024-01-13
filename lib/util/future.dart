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
      return value;
    }
    return Optional<T>.ofNullable(_results[key]);
  }

  Optional<DateTime> lastCached(String key) {
    return Optional.ofNullable(_requests[key]?.$1);
  }

  Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetch, {
    Duration ttl = Duration.zero,
  }) async {
    final now = DateTime.now();
    final cached = _requests[key];
    if (cached != null && !isExpired(now, cached.$1, ttl)) {
      return cached.$2 ?? _results[key];
    }

    final request = guard(fetch);
    _requests[key] = (now, request);

    final result = await request;

    _results[key] = result;
    _requests[key] = (now, null);

    if (ttl == Duration.zero) {
      _requests.remove(key);
      _results.remove(key);
    }

    return result;
  }

  bool isExpired(DateTime now, DateTime cached, Duration ttl) =>
      now.difference(cached) > ttl;
}
