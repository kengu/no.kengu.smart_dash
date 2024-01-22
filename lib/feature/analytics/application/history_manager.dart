import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/analytics/data/time_series_repository.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/stream.dart';
import 'package:smart_dash/util/time/time_series.dart';

part 'history_manager.g.dart';

/// The [HistoryManager] class listen to [FlowEvent] and records them
/// to history. After recording is complete, a [HistoryEvent] is published.
class HistoryManager {
  HistoryManager(
    this.ref, {
    // TODO: Implement settings for maxLength (default = 0, indefinite)
    this.maxLength = 1440, // 24*60m=24h
  });

  final Ref ref;
  final int maxLength;
  final Duration limit = const Duration(seconds: 5);
  final Duration delay = const Duration(milliseconds: 50);
  final StreamController<HistoryEvent> _controller =
      StreamController.broadcast();

  // Cache to limit number of async calls
  final _cache = FutureCache(prefix: '$HistoryManager');

  /// Get stream of [HistoryEvent]s.
  Stream<HistoryEvent> get events => _controller.stream;

  StreamSubscription<FlowEvent>? _changes;

  /// Start pumping history events by binding to device updates
  void bind() async {
    assert(_changes == null, 'HistoryManager is started already');
    _changes = ref
        .read(flowManagerProvider)
        .events
        .where((e) => e.isNumber())
        .listen(_onHandle);
  }

  /// Stop pumping history events by unbinding from global event pump.
  void unbind() {
    _changes?.cancel();
    _changes = null;
  }

  /// Pump current [HistoryEvent]s
  Future<void> pump(
      {List<Token> tokens = const [], DateTime? when, Duration? ttl}) async {
    // Get current tokens
    final all = await getTokens(ttl);
    final stream = Stream.fromIterable(all)
        .where((e) => tokens.isEmpty || tokens.contains(e));
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
  }

  /// Load current tokens from storage
  Future<List<Token>> getTokens([Duration? ttl]) async {
    return _cache.getOrFetch('tokens', () async {
      return await ref.read(timeSeriesRepositoryProvider).getTokens();
    }, ttl: ttl);
  }

  /// Get all tokens loaded in manager
  Optional<List<Token>> getTokensCached() => _cache.get('tokens');

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
    final key = 'token:${token.name}:$offset';
    return _cache.getOrFetch(key, () async {
      final repo = ref.read(timeSeriesRepositoryProvider);
      return await repo.get(token, offset);
    }, ttl: ttl);
  }

  Optional<TimeSeries> getCached(Token token, {DateTime? when}) {
    final offset = toOffset(when);
    return _cache.get('token:${token.name}:$offset');
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

  Future<void> _onHandle(FlowEvent event) {
    return guard<void>(
      () async {
        final repo = ref.read(timeSeriesRepositoryProvider);
        final offset = toOffset();
        final result = await repo.get(event.token, offset);
        var history = result.isPresent ? result.value : event.token.emptyTs();
        final next = switch (event.type) {
          const (int) => history.record<int>(
              event.data as int,
              event.when,
              pad: 0,
              max: maxLength,
            ),
          const (double) => history.record<double>(
              event.data as double,
              event.when,
              pad: 0,
              max: maxLength,
            ),
          _ => throw UnsupportedError(
              'History manager does not handle [${event.type}]',
            ),
        };
        if (next != history) {
          await repo.save(next);
          _controller.add(HistoryEvent(
            event.token,
            next,
          ));
        }
      },
      task: 'HistoryManager::_onHandle',
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryEvent &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          data == other.data;

  @override
  int get hashCode => token.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'HistoryEvent{token: $token}';
  }
}

@Riverpod(keepAlive: true)
HistoryManager historyManager(HistoryManagerRef ref) => HistoryManager(ref);

@riverpod
Stream<HistoryEvent> history(HistoryRef ref, [List<Token> tokens = const []]) {
  return ref.watch(historyManagerProvider).events.where(
        (e) => tokens.isEmpty || tokens.contains(e.token),
      );
}

@riverpod
Stream<HistoryEvent> powerHistory(PowerHistoryRef ref) {
  return ref.watch(historyManagerProvider).events.where((e) => e.isPower);
}

@riverpod
Stream<HistoryEvent> energyHistory(EnergyHistoryRef ref) {
  return ref.watch(historyManagerProvider).events.where((e) => e.isEnergy);
}

@riverpod
Stream<HistoryEvent> voltageHistory(VoltageHistoryRef ref) {
  return ref.watch(historyManagerProvider).events.where((e) => e.isVoltage);
}
