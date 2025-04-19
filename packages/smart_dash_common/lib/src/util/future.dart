import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class FutureCache {
  FutureCache({required this.prefix});

  static FutureCache of<T>() {
    return FutureCache(prefix: '${typeOf<T>()}');
  }

  final String prefix;

  final Map<String, dynamic> _results = {};
  final Map<String, (DateTime, Future?)> _requests = {};

  Map<String, dynamic> get results => Map.of(_results);

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

  Optional<T> set<T>(String key, Optional<T> value, [DateTime? when]) {
    _results[key] = value;
    _requests[key] = (when ?? DateTime.now(), Future.value(value));
    return value;
  }

  Optional<T> setIfExists<T>(String key, T Function(T value) set) {
    T? next;
    final current = _results[key];
    final isOptional = current is Optional;
    if (current != null) {
      if (isOptional && current.isPresent) {
        next = set(current.value);
      } else if (current is T) {
        next = set(current);
      }
    }
    if (next != null) {
      _results[key] = isOptional ? Optional.of(next) : next;
      _requests[key] = (DateTime.now(), Future.value(next));
    }
    return Optional.ofNullable(next);
  }

  void setTTL(String key, DateTime when) {
    if (_requests.containsKey(key)) {
      final item = _requests[key]!;
      _requests[key] = (when, item.$2);
    }
  }

  Optional<DateTime> lastCached(String key) {
    return Optional.ofNullable(_requests[key]?.$1);
  }

  // TODO: Pass existing item to fetch when expired
  Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetch, {
    Duration? ttl = Duration.zero,
    GuardErrorHandler<T>? onError,
    void Function(T data)? onResult,
  }) async {
    final now = DateTime.now();
    final cached = _requests[key];
    if (cached != null && !isExpired(now, cached.$1, ttl)) {
      final result = _results[key];
      if (result is T) {
        return result;
      }
      if (cached.$2 is Future<T>) {
        return cached.$2 as Future<T>;
      }
    }

    final request = guard(
      fetch,
      task: 'getOrFetch',
      name: '$prefix:$key',
    );
    _requests[key] = (now, request);

    final result = await request;

    _results[key] = result;
    _requests[key] = (now, Future.value(result));

    if (ttl == Duration.zero) {
      _requests.remove(key);
      _results.remove(key);
    }

    if (onResult != null) onResult(result);

    return result;
  }

  void flush(String key) {
    _results.remove(key);
    _requests.remove(key);
  }

  bool isExpired(DateTime now, DateTime cached, Duration? ttl) =>
      ttl != null && now.difference(cached) > ttl;
}
