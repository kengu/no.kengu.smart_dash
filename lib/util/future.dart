import 'package:optional/optional.dart';

import 'guard.dart';

class FutureCache {
  FutureCache({required this.prefix});

  final String prefix;

  final Map<String, dynamic> _results = {};
  final Map<String, (DateTime, Future)> _requests = {};

  Optional<T> get<T>(String key) {
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
    if (cached != null && isExpired(now, cached, ttl)) {
      return cached.$2 as Future<T>;
    }

    final request = guard(fetch);
    _requests[key] = (now, request);

    final result = await request;

    _results[key] = result;
    if (ttl == Duration.zero) {
      _requests.remove(key);
      _results.remove(key);
    }

    return result;
  }

  bool isExpired(DateTime now, (DateTime, Future) cached, Duration ttl) =>
      now.difference(cached.$1) < ttl;
}
