import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/application/notification_service.dart';
import 'package:smart_dash/feature/flow/application/block_flow.dart';
import 'package:smart_dash/feature/flow/data/block_repository.dart';
import 'package:smart_dash/feature/flow/domain/flow.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/stream.dart';
import 'package:smart_dash/util/type.dart';
import 'package:stream_transform/stream_transform.dart';

part 'flow_manager.g.dart';

class FlowManager {
  FlowManager(this.ref);

  final Ref ref;
  final _flows = <String, Flow>{};
  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);
  final StreamController<FlowEvent> _controller = StreamController.broadcast();

  final Map<Type, StreamSubscription> _subscriptions = {};

  /// Get stream of [FlowEvent]s.
  Stream<FlowEvent> get events => _controller.stream;

  /// Check if [Flow] for given [Flow.key] exists
  bool exists(String key) => _flows.containsKey(key);

  Future<void> init() async {
    assert(_flows.isEmpty, 'FlowManager is initialized already');
    for (final model in await ref.read(blockRepositoryProvider).getAll()) {
      register(BlockFlow(model: model));
    }
  }

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

  /// Bind to stream of [T] events.
  ///
  /// Use [limit] to reduce the rate that events
  /// are processed to at most once per duration
  void bind<T extends Object>(
    Stream<T> events, {
    Duration limit = const Duration(seconds: 5),
  }) {
    final type = typeOf<T>();
    assert(
      !_subscriptions.containsKey(type),
      'Stream of $type already bound',
    );
    _subscriptions[type] = events.throttle(limit).listen(trigger);
  }

  /// Unbind from stream of [T] events
  void unbind<T extends Object>(Stream<T> events) {
    final type = typeOf<T>();
    final subscription = _subscriptions[type];
    assert(subscription != null, 'Stream of $type not bound');
    subscription!.cancel();
    _subscriptions.remove(type);
  }

  /// Unbind from all streams
  void unbindAll() {
    for (final it in _subscriptions.values) {
      it.cancel();
    }
    _subscriptions.clear();
  }

  Future<void> trigger(Object event) {
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
            if (event is BlocEvent) {
              final flow = evaluate as BlockFlow;
              await ref.read(blockRepositoryProvider).updateAll([flow.model]);
              debugPrint('FlowManager >> Updated Block [${flow.model.name}]');
              switch (event.runtimeType) {
                case const (BlockNotificationEvent):
                  final notification = event as BlockNotificationEvent;
                  ref.read(notificationServiceProvider).show(
                        title: notification.action.label,
                        body: notification.action.description,
                      );
                  continue;
              }
            }
            // Process list of flow events in order of completion
            _controller.add(event);
          }
        }
      },
      task: 'trigger',
      name: 'FlowManager',
    );
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
