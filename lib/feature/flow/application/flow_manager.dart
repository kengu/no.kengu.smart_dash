import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/feature/notification/application/notification_service.dart';
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
  final Map<Type, StreamSubscription> _subscriptions = {};
  final StreamController<FlowEvent> _controller = StreamController.broadcast();

  /// Get stream of [FlowEvent]s.
  Stream<FlowEvent> get events => _controller.stream;

  /// Check if [Flow] for given [Flow.key] exists
  bool exists(String key) => _flows.containsKey(key);
  Future<void> init() async {
    assert(_flows.isEmpty, 'FlowManager is initialized already');
    for (final id in await ref.read(blockRepositoryProvider).getIds()) {
      final flow = BlockFlow(ref: ref, id: id);
      await flow.init();
      register(flow);
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

  Future<List<String>> getTags() async {
    final tags = <String>{};
    for (final token in await getTokens()) {
      tags.add(token.tag);
    }
    return tags.toList();
  }

  Optional<List<Token>> getCachedTokens() {
    return ref.read(deviceServiceProvider).getCachedTokens();
  }

  Future<List<Token>> getTokens() async {
    return ref.read(deviceServiceProvider).getTokens();
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
            if (event is BlockEvent) {
              switch (event.runtimeType) {
                case const (BlockNotificationEvent):
                  final notification = event as BlockNotificationEvent;
                  ref.read(notificationServiceProvider).show(
                        title: notification.label,
                        body: notification.description,
                      );
                  break;
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

  Future<bool> addOrUpdate(BlockModel data, {bool notify = true}) async {
    final repo = ref.read(blockRepositoryProvider);
    final exists = await repo.get(data.id);
    final result = await repo.addOrUpdate([data]);
    if (notify) {
      final builder =
          (exists.isPresent ? BlockUpdatedEvent.new : BlockAddedEvent.new);
      final event = builder(
        flow: BlockFlow.toKey(data.id),
        model: data,
        tags: [],
      );
      _controller.add(event);
    }
    return result.isNotEmpty;
  }

  Future<bool> delete(String id) async {
    final repo = ref.read(blockRepositoryProvider);
    final block = await repo.get(id);
    if (!block.isPresent) return false;
    _flows.remove(BlockFlow.toKey(id));
    final deleted = await repo.removeAll([block.value]);
    if (deleted.isNotEmpty) {
      final event = BlockDeletedEvent(
        flow: BlockFlow.toKey(id),
        model: block.value,
      );
      _controller.add(event);
    }
    return deleted.isNotEmpty;
  }
}

class FlowEventQuery {
  FlowEventQuery({required this.when});
  final bool Function(FlowEvent) when;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowEventQuery &&
          runtimeType == other.runtimeType &&
          when == other.when;

  @override
  int get hashCode => when.hashCode;
}

@Riverpod(keepAlive: true)
FlowManager flowManager(FlowManagerRef ref) => FlowManager(ref);

@riverpod
Stream<FlowEvent> flow(FlowRef ref, FlowEventQuery query) async* {
  final manager = ref.watch(flowManagerProvider);
  await for (final event in manager.events.where(query.when)) {
    yield event;
  }
}

class BlockFlowQuery {
  BlockFlowQuery({required this.id});

  final String id;

  bool when(BlockEvent event) => event.model.id == id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockFlowQuery &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@riverpod
Stream<BlockModel> blockModelFlow(
    BlockModelFlowRef ref, BlockFlowQuery query) async* {
  final manager = ref.watch(flowManagerProvider);
  final repo = ref.watch(blockRepositoryProvider);
  final model = await repo.get(query.id);
  if (model.isPresent) {
    yield model.value;
  }
  final stream = manager.events.whereType<BlockEvent>().where(query.when);
  await for (final event in stream) {
    yield event.model;
  }
}
