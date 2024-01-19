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
  final Duration delay = const Duration(milliseconds: 200);
  final StreamController<HistoryEvent> _controller =
      StreamController.broadcast();

  // Cache to limit number of async calls
  final _cache = FutureCache(prefix: '$HistoryManager');

  /// Get stream of [HistoryEvent]s.
  Stream<HistoryEvent> get events => _controller.stream;

  /// Check if [TimeSeries] for given [Token] exists
  bool exists(Token token) => tokens.contains(token);

  /// Get all tokens loaded in manager
  List<Token> get tokens =>
      _cache.get<Map<String, Token>>('tokens').firstOrNull?.values.toList() ??
      <Token>[];

  /// Load current tokens from storage
  Future<List<Token>> loadTokens() async {
    return (await _loadTokens()).values.toList();
  }

  Future<Map<String, Token>> _loadTokens() async {
    return _cache.getOrFetch<Map<String, Token>>(
      'tokens',
      () async {
        final tokens = await ref.read(timeSeriesRepositoryProvider).getTokens();
        return Map.fromEntries(tokens.map(
          (e) => MapEntry(e.name, e),
        ));
      },
      ttl: const Duration(milliseconds: 150),
    );
  }

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
  Future<void> pump() async {
    // NOTE: We should not add events too fast to stream for
    // overall performance reasons. And StreamProviders only
    // sees last event when events are added more frequently
    // than 60 fps (less than 17 milliseconds between each event).
    await for (final history in all().delayed(delay)) {
      // Process list of flow events in order of completion
      final cached = _cache.get<Map<String, Token>>('tokens');
      final tokens = cached.isPresent ? cached.value : await _loadTokens();
      final token = tokens[history.name];
      assert(token != null, 'Token for history [${history.name}] not found');
      _controller.add(HistoryEvent(
        token!,
        history,
      ));
    }
  }

  Stream<TimeSeries> all([DateTime? when]) async* {
    final repo = ref.read(timeSeriesRepositoryProvider);
    for (final token in await loadTokens()) {
      final result = await repo.get(token, toOffset(when));
      if (result.isPresent) {
        yield result.value;
      }
    }
  }

  Future<List<TimeSeries>> getAll({
    DateTime? when,
    Duration ttl = const Duration(seconds: 4),
  }) async {
    final series = <TimeSeries>[];
    for (final token in await loadTokens()) {
      final result = await get(token, when: when, ttl: ttl);
      if (result.isPresent) {
        series.add(result.value);
      }
    }
    return series;
  }

  List<TimeSeries> getCachedAll({DateTime? when}) {
    final series = <TimeSeries>[];
    for (final token in tokens) {
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
    Duration ttl = const Duration(seconds: 4),
  }) {
    final key = 'token:${token.name}:$when';
    return _cache.getOrFetch(key, () async {
      final repo = ref.read(timeSeriesRepositoryProvider);
      return await repo.get(token, toOffset(when));
    }, ttl: ttl);
  }

  Optional<TimeSeries> getCached(Token token, {DateTime? when}) {
    return _cache.get('token:${token.name}:$when');
  }

  Future<List<TimeSeries>> where(
    Function(Token e) compare, {
    DateTime? when,
    Duration ttl = const Duration(seconds: 4),
  }) async {
    final series = <TimeSeries>[];
    for (final token in await loadTokens()) {
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
    for (final token in tokens) {
      if (compare(token)) {
        final result = getCached(token, when: when);
        if (result.isPresent) {
          series.add(result.value);
        }
      }
    }
    return series;
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

  bool get isPower => token.isPower;
  bool get isEnergy => token.isEnergy;
  bool get isVoltage => token.isVoltage;

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
Stream<HistoryEvent> history(HistoryRef ref) async* {
  final manager = ref.watch(historyManagerProvider);
  await for (final event in manager.events) {
    yield event;
  }
}

@riverpod
Stream<HistoryEvent> powerHistory(PowerHistoryRef ref) async* {
  final manager = ref.watch(historyManagerProvider);
  await for (final event in manager.events.where((e) => e.isPower)) {
    yield event;
  }
}

@riverpod
Stream<HistoryEvent> energyHistory(EnergyHistoryRef ref) async* {
  final manager = ref.watch(historyManagerProvider);
  await for (final event in manager.events.where((e) => e.isEnergy)) {
    yield event;
  }
}

@riverpod
Stream<HistoryEvent> voltageHistory(VoltageHistoryRef ref) async* {
  final manager = ref.watch(historyManagerProvider);
  await for (final event in manager.events.where((e) => e.isVoltage)) {
    yield event;
  }
}
