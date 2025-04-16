import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:stream_transform/stream_transform.dart';

part 'calculation_engine.g.dart';

class CalculationEvent {}

abstract class Calculation {
  Future<CalculationEvent> call();
}

/// This
class CalculationEngine {
  CalculationEngine(this.ref) {
    ref.onDispose(() {
      if (_timing != null) unbind();
    });
  }

  final Ref ref;
  final _calculations = <Calculation>[];
  final Duration period = const Duration(minutes: 1);

  final StreamController<CalculationEvent> _controller =
      StreamController.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Get stream of [Calculation] results
  Stream<CalculationEvent> get events => _controller.stream;

  /// Start calculations by binding it to global event pump.
  void bind(Stream<DateTime> events) {
    assert(_timing == null, 'CalculationEngine is started already');
    _timing = events.throttle(period).listen((event) {
      // TODO: Add error handling.
      guard<void>(onCalculate);
    }, cancelOnError: false);
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
CalculationEngine calculationEngine(Ref ref) => CalculationEngine(ref);
