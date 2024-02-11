import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/stream.dart';
import 'package:smart_dash/util/type.dart';
import 'package:stream_transform/stream_transform.dart';

part 'flow_manager.g.dart';

class FlowManager {
  FlowManager(this.ref);

  final Ref ref;
  final _flows = <String, Flow>{};
  // TODO Make limit configurable
  final Duration limit = const Duration(seconds: 5);
  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);
  final StreamController<FlowEvent> _controller = StreamController.broadcast();

  StreamSubscription<DriverUpdatedEvent>? _updates;

  /// Get stream of [FlowEvent]s.
  Stream<FlowEvent> get events => _controller.stream;

  /// Check if [Flow] for given [Flow.key] exists
  bool exists(String key) => _flows.containsKey(key);

  /// [DeviceDriver] should call this to register
  void register(Flow flow) {
    assert(
      !_flows.containsKey(flow.key),
      'FlowManager: ${flow.runtimeType}[key:${flow.key}] already registered',
    );

    _flows[flow.key] = flow;
    debugPrint(
      'FlowManager: ${flow.runtimeType}[key:${flow.key}] registered',
    );
  }

  /// Start pumping flow events by binding to device updates
  void bind() {
    assert(_updates == null, 'FlowManager is started already');
    _updates = ref
        .read(deviceDriverManagerProvider)
        .updated
        .throttle(limit)
        .listen(_onTrigger);
  }

  /// Stop pumping flow events by unbinding from global event pump.
  void unbind() {
    _updates?.cancel();
    _updates = null;
  }

  Future<void> _onTrigger(DriverUpdatedEvent event) {
    return guard<void>(
      () async {
        for (final evaluate in _flows.values.where(
          (flow) => flow.when(event),
        )) {
          // NOTE: We should not add events too fast to stream for
          // overall performance reasons. And StreamProviders only
          // sees last event when events are added more frequently
          // than 60 fps (less than 17 milliseconds between each event).
          await for (final event in evaluate(event).delayed(delay)) {
            // Process list of flow events in order of completion
            _controller.add(event);
          }
        }
      },
      task: '_onTrigger',
      name: 'FlowManager',
    );
  }
}

abstract class Flow {
  const Flow(this.key);

  final String key;

  bool when(Object event);

  @visibleForOverriding
  Stream<FlowEvent> evaluate(Object event);

  /// Default method
  Stream<FlowEvent> call(Object event) => evaluate(event);
}

class FlowEvent<T> {
  FlowEvent(this.token, this.data, this.when) {
    assert(
      token.isType(data),
      'Token type [${token.type}] does not match data type [$type]',
    );
  }

  final T data;
  final Token token;
  final DateTime when;

  Type get type => typeOf<T>();

  bool isNumber() => this.data is num;

  bool isType<E>() => this is FlowEvent<E>;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowEvent &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          data == other.data;

  @override
  int get hashCode => token.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'FlowEvent{token: $token}';
  }
}

@Riverpod(keepAlive: true)
FlowManager flowManager(FlowManagerRef ref) => FlowManager(ref);

@riverpod
Stream<FlowEvent> flow(FlowRef ref) async* {
  final manager = ref.watch(flowManagerProvider);
  await for (final event in manager.events) {
    yield event;
  }
}
