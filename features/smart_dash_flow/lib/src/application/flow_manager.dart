import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

part 'flow_manager.g.dart';

class FlowManager {
  FlowManager(this.ref);

  final Ref ref;
  final _flows = <String, Flow>{};

  final _log = Logger('$FlowManager');

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);
  final Map<Type, StreamSubscription> _subscriptions = {};
  final StreamController<FlowEvent> _controller = StreamController.broadcast();

  /// Get stream of [FlowEvent]s.
  Stream<FlowEvent> get events => _controller.stream;

  /// Check if [Flow] for given [Flow.key] exists
  bool exists(String key) => _flows.containsKey(key);

  void register(Flow flow) {
    assert(
      !_flows.containsKey(flow.key),
      'FlowManager: $Flow[key:${flow.key}] already registered',
    );

    _flows[flow.key] = flow;
    _log.info(
      '$Flow[key:${flow.key}] registered',
    );
  }

  void unregister(String key) {
    assert(
      !_flows.containsKey(key),
      'FlowManager: $Flow[key:$key] not found',
    );

    _flows.remove(key);
    _log.info(
      '$Flow[key:$key] unregistered',
    );
  }

  /// Bind to stream of [T] events.
  void bind<T extends Object>(Stream<T> events) {
    final type = typeOf<T>();
    assert(
      !_subscriptions.containsKey(type),
      'Stream of $type already bound',
    );
    _subscriptions[type] = events.delayed(delay).listen(
          trigger,
          cancelOnError: false,
        );
  }

  /// Unbind from all streams
  void unbind<T extends Object>() {
    final type = typeOf<T>();
    assert(
      _subscriptions.containsKey(type),
      'Stream of $type is not bound',
    );
    _subscriptions[type]!.cancel();
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
        for (final evaluate in List.of(_flows.values).where(
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
      task: 'trigger',
      name: 'FlowManager',
    );
  }

  Future<bool> addOrUpdate(BlockModel data, {bool notify = true}) async {
    final repo = ref.read(blockRepositoryProvider);
    final exists = await repo.get(data.id);
    final result = await repo.updateAll([data]);
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
FlowManager flowManager(Ref ref) => FlowManager(ref);

@riverpod
Stream<FlowEvent> flow(Ref ref, FlowEventQuery query) async* {
  final manager = ref.watch(flowManagerProvider);
  await for (final event in manager.events.where(query.when)) {
    yield event;
  }
}
