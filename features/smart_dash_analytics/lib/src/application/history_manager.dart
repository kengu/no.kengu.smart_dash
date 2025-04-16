import 'dart:async';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'history_manager.g.dart';

typedef TokensCallback = Future<List<Token>> Function([Duration? ttl]);

/// The [HistoryManager] class listen to [FlowEvent] and records them
/// to history. After recording is complete, a [HistoryEvent] is published.
class HistoryManager {
  HistoryManager(
    this.ref, {
    // TODO: Implement settings for maxLength (default = 0, indefinite)
    this.maxLength = 1440, // 24*60m=24h
  }) {
    ref.onDispose(() {
      if (_subscriptions.isNotEmpty) {
        unbind();
      }
    });
  }

  final Ref ref;

  final int maxLength;

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);

  final StreamController<HistoryEvent> _controller =
      StreamController.broadcast();

  // Cache to limit number of async calls
  final _cache = FutureCache(prefix: '$HistoryManager');

  /// Get stream of [HistoryEvent]s.
  Stream<HistoryEvent> get events => _controller.stream;

  final List<StreamSubscription> _subscriptions = [];

  late final TokensCallback _fetch;

  /// Start pumping history events by binding to device updates
  Future<void> bind(Stream<Iterable<Tag>> tags, TokensCallback fetch) async {
    assert(_subscriptions.isEmpty, 'HistoryManager is bound already');
    _fetch = fetch;
    _subscriptions.add(
      tags.listen(_onHandle, cancelOnError: false),
    );
  }

  /// Stop pumping history events by unbinding from global event pump.
  void unbind() {
    for (final it in _subscriptions) {
      it.cancel();
    }
    _subscriptions.clear();
  }

  /// Pump current [HistoryEvent]s
  Future<void> pump({
    List<Token> tokens = const [],
    DateTime? when,
    Duration? ttl,
  }) {
    assert(_subscriptions.isNotEmpty, 'HistoryManager is not bound');
    return guard(
      () async {
        // Get current tokens
        final all = tokens.isEmpty ? await getTokens(ttl) : tokens;
        final stream = Stream.fromIterable(all);
        // NOTE: We should not add events too fast to stream for
        // overall performance reasons. And StreamProviders only
        // sees last event when events are added more frequently
        // than 60 fps (less than 17 milliseconds between each event).
        await for (final token in stream.delayed(delay)) {
          // Process list of flow events in order of completion
          final history = await get(token, when: when, ttl: ttl);
          if (history.isPresent) {
            _controller.add(HistoryEvent(
              token,
              history.value,
            ));
          }
        }
      },
      task: 'pump',
      name: 'HistoryManager',
    );
  }

  Optional<List<Token>> getTokensCached() {
    return _cache.get('tokens');
  }

  Future<List<Token>> getTokens([Duration? ttl]) async {
    return _cache.getOrFetch(
      'tokens',
      () => _fetch(ttl),
      ttl: ttl,
    );
  }

  Future<List<TimeSeries>> getAll({
    DateTime? when,
    Duration? ttl,
  }) async {
    final series = <TimeSeries>[];
    for (final token in await getTokens()) {
      final result = await get(token, when: when, ttl: ttl);
      if (result.isPresent) {
        series.add(result.value);
      }
    }
    return series;
  }

  List<TimeSeries> getCachedAll({DateTime? when}) {
    final series = <TimeSeries>[];
    for (final token in getTokensCached().orElseNull ?? []) {
      final result = getCached(token, when: when);
      if (result.isPresent) {
        series.add(result.value);
      }
    }
    return series;
  }

  Future<Optional<TimeSeries>> get(
    Token token, {
    DateTime? when,
    Duration? ttl,
  }) {
    final offset = toOffset(when);
    final key = _tokenCacheKey(token.name, offset);
    return _cache.getOrFetch(key, () async {
      final repo = ref.read(timeSeriesRepositoryProvider);
      return await repo.get(token, offset);
    }, ttl: ttl);
  }

  Optional<TimeSeries> getCached(Token token, {DateTime? when}) {
    final offset = toOffset(when);
    return _cache.get(
      _tokenCacheKey(token.name, offset),
    );
  }

  Future<List<TimeSeries>> where(
    Function(Token e) compare, {
    DateTime? when,
    Duration? ttl,
  }) async {
    final series = <TimeSeries>[];
    for (final token in await getTokens()) {
      if (compare(token)) {
        final result = await get(token, when: when, ttl: ttl);
        if (result.isPresent) {
          series.add(result.value);
        }
      }
    }
    return series;
  }

  List<TimeSeries> whereCached(Function(Token e) compare, {DateTime? when}) {
    final series = <TimeSeries>[];
    for (final token in getTokensCached().orElseNull ?? []) {
      if (compare(token)) {
        final result = getCached(token, when: when);
        if (result.isPresent) {
          series.add(result.value);
        }
      }
    }
    return series;
  }

  Stream<TimeSeries> stream(Token token) {
    return _controller.stream.where((e) => e.token == token).map((e) => e.data);
  }

  Stream<TimeSeries> streamAll() {
    return _controller.stream.map((e) => e.data);
  }

  Stream<TimeSeries> streamWhere(Function(Token e) compare,
      {DateTime? when}) async* {
    final repo = ref.read(timeSeriesRepositoryProvider);
    for (final token in await getTokens()) {
      final result = await repo.get(token, toOffset(when));
      if (result.isPresent) {
        yield result.value;
      }
    }
  }

  String _tokenCacheKey(String name, DateTime offset) {
    return 'token:$name:$offset';
  }

  /// Handle tags in a time-orderly only manner.
  /// Discards events that happened before last
  /// element in history
  Future<void> _onHandle(Iterable<Tag> tags) {
    return guard<void>(
      () async {
        final offset = toOffset();
        final repo = ref.read(timeSeriesRepositoryProvider);
        for (final tag in tags.where((e) => e.isNumber())) {
          final result = await repo.get(tag.token, offset);

          // Create new history for offset if not found in repo
          final history = result.isPresent
              ? result.value
              : tag.token.emptyTs(offset: offset);

          // Has event happened passed end of history?
          if (tag.when.difference(history.end) > history.span) {
            final next = switch (tag.type) {
              const (int) => history.record<int>(
                  tag.data as int,
                  tag.when,
                  max: maxLength,
                ),
              const (double) => history.record<double>(
                  tag.data as double,
                  tag.when,
                  max: maxLength,
                ),
              _ => throw UnsupportedError(
                  'History manager does '
                  'not handle tag type [${tag.type}]',
                ),
            };
            if (next != history) {
              await repo.save(next);
              // Keep result for cached lookups
              _cache.setIfExists<TimeSeries>(
                _tokenCacheKey(next.name, offset),
                (_) => next,
              );
              // Notify listeners
              _controller.add(HistoryEvent(
                tag.token,
                next,
              ));
            }
          }
        }
      },
      task: '_onHandle',
      name: 'HistoryManager',
    );
  }

  static DateTime toOffset([DateTime? when]) {
    when ??= DateTime.now();
    return DateTime(when.year, when.month, when.day);
  }
}

class HistoryEvent {
  HistoryEvent(this.token, this.data);

  final Token token;
  final TimeSeries data;

  bool get isOnOff => token.isOnOff;
  bool get isPower => token.isPower;
  bool get isEnergy => token.isEnergy;
  bool get isVoltage => token.isVoltage;
  bool get isTemperature => token.isTemperature;

  @override
  String toString() {
    return 'HistoryEvent{token: $token}';
  }
}

@Riverpod(keepAlive: true)
HistoryManager historyManager(Ref ref) => HistoryManager(ref);

@Riverpod(keepAlive: true)
Stream<HistoryEvent> history(Ref ref, [Token? token]) {
  final manager = ref.watch(historyManagerProvider);
  manager.pump(tokens: [if (token != null) token]);
  return manager.events.where(
    (e) {
      final match = token == null || e.token == token;
      if (match) {
        final log = Logger('history()');
        log.fine('${e.runtimeType}[${e.token.name}]');
      }
      return match;
    },
  );
}
