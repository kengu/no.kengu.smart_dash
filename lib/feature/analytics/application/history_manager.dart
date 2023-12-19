import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/analytics/data/time_series_repository.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/stream.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/util/typedefs.dart';

part 'history_manager.g.dart';

typedef HistoryTokenMap = Map<Token, ValueBuilder<num, FlowEvent>>;

/// The [HistoryManager] class listen to [FlowEvent] and records them
/// to history. After recording is complete, a [HistoryEvent] is published.
/// The following [FlowEvent] types are recorded to history.
///
/// * Power ([FlowEvent.type] is [Token.power])
/// * Energy ([FlowEvent.type] is [Token.energy])
/// * Voltage ([FlowEvent.type] is [Token.voltage])
///
class HistoryManager {
  HistoryManager(
    this.ref,
    HistoryTokenMap tokens, {
    // TODO: Implement settings for maxLength (default = 0, indefinite)
    this.maxLength = 1440, // 24*60m=24h
  }) : _tokens = Map.from(tokens);

  final Ref ref;
  final int maxLength;
  final HistoryTokenMap _tokens;
  final Duration limit = const Duration(seconds: 5);
  final Duration delay = const Duration(milliseconds: 200);
  final StreamController<HistoryEvent> _controller =
      StreamController.broadcast();

  StreamSubscription<FlowEvent>? _changes;

  /// Get stream of [HistoryEvent]s.
  Stream<HistoryEvent> get events => _controller.stream;

  /// Check if [TimeSeries] for given [Token] exists
  bool exists(Token token) => _tokens.containsKey(token);

  /// Start pumping history events by binding to device updates
  void bind() {
    assert(_changes == null, 'HistoryManager is started already');
    _changes = ref
        .read(flowManagerProvider)
        .events
        .where((e) => _tokens.containsKey(e.token))
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
      _controller.add(HistoryEvent(
        _tokens.keys.firstWhere(
          (t) => t.name == history.name,
        ),
        history,
      ));
    }
  }

  Stream<TimeSeries> all() async* {
    final repo = ref.read(timeSeriesRepositoryProvider);
    for (final token in _tokens.keys) {
      final result = await repo.get(token);
      if (result.isPresent) {
        yield result.value;
      }
    }
  }

  Future<Optional<TimeSeries>> get(Token token) => guard(() async {
        final repo = ref.read(timeSeriesRepositoryProvider);
        return await repo.get(token);
      });

  Future<void> _onHandle(FlowEvent event) => guard<void>(() async {
        final tic = DateTime.now();
        final repo = ref.read(timeSeriesRepositoryProvider);
        final result = await repo.get(event.token);
        var history = result.isPresent
            ? result.value
            : TimeSeries(
                offset: DateTime.now(),
                name: event.token.name,
                span: TimeScale.minutes.to(),
                array: DataArray.size(1, [event.token.toJson()]),
              );
        final builder = _tokens[event.token];
        if (builder != null) {
          final next = _record(
            history,
            builder(event),
            event.when,
          );
          if (next != history) {
            await repo.save(next);
            _controller.add(HistoryEvent(
              event.token,
              result.value,
            ));
          }
        }
        if (false) {
          debugPrint(
            '_onHandle():: [${DateTime.now().difference(tic).inMilliseconds}ms]',
          );
        }
      }, task: 'HistoryManager::_onHandle');

  TimeSeries _record(TimeSeries history, num value, DateTime when) {
    switch (value.runtimeType) {
      case const (int):
        return history.record<int>(
          value as int,
          when,
          pad: 0,
          max: maxLength,
        );
      case const (double):
        return history.record<double>(
          value as double,
          when,
          pad: 0,
          max: maxLength,
        );
    }
    throw UnsupportedError(
      'Unsupported value type ${value.runtimeType}',
    );
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
HistoryManager historyManager(HistoryManagerRef ref) => HistoryManager(ref, {
      Tokens.power: (event) => event.data as int,
      Tokens.voltage: (event) => event.data as int,
      Tokens.energy: (event) => (event.data as EnergySummary).cumulativeToday,
    });

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
