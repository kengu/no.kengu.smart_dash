import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/analytics/application/timing_service.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:stream_transform/stream_transform.dart';

part 'calculation_engine.g.dart';

class CalculationEvent {}

abstract class Calculation {
  Future<CalculationEvent> call();
}

/// This
class CalculationEngine {
  CalculationEngine(this.ref);

  final Ref ref;
  final _calculations = <Calculation>[];
  final Duration period = const Duration(minutes: 1);

  final StreamController<CalculationEvent> _controller =
      StreamController.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Get stream of [Calculation] results
  Stream<CalculationEvent> get events => _controller.stream;

  /// Start calculations by binding it to global event pump.
  void bind() {
    assert(_timing == null, 'CalculationEngine is started already');
    _timing =
        ref.read(timingServiceProvider).events.throttle(period).listen((event) {
      // TODO: Add error handling.
      guard<void>(onCalculate);
    });
  }

  /// Stops calculations by unbinding from global event pump.
  void unbind() {
    _timing?.cancel();
    _timing = null;
  }

  Future<void> onCalculate() async {
    for (final calculation in _calculations) {
      await calculation();
    }
  }
}

@Riverpod(keepAlive: true)
CalculationEngine calculationEngine(CalculationEngineRef ref) =>
    CalculationEngine(ref);
