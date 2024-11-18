import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timing_service.g.dart';

class TimingService {
  TimingService(this.ref);
  final Ref ref;

  Timer? _loop;
  final StreamController<DateTime> _controller = StreamController.broadcast();

  /// Get stream of timing events
  Stream<DateTime> get events => _controller.stream;

  /// Start pumping update events to registered drivers.
  /// The manager will call [DeviceDriver.onUpdate] with given
  /// [period] (default 1 second).
  void start([Duration period = const Duration(milliseconds: 1000)]) {
    assert(_loop == null, 'TimingService is started already');
    _loop = Timer.periodic(period, (timer) {
      _controller.add(DateTime.now());
    });
  }

  /// Stop emitting timing events. Events already emitted
  /// but not consumed will not be cancelled.
  void stop() {
    assert(_loop != null, 'TimingService is not started');
    _loop!.cancel();
  }
}

@Riverpod(keepAlive: true)
TimingService timingService(TimingServiceRef ref) => TimingService(ref);
