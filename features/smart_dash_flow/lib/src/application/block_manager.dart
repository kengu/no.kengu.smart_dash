import 'dart:async';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:stream_transform/stream_transform.dart';

part 'block_manager.g.dart';

typedef BlockFlowBuilder = BlockFlow Function(Ref ref, String id);

class BlockManager {
  BlockManager(this.ref);

  final Ref ref;

  final _builders = <String, BlockFlowBuilder>{};

  final _log = Logger('$BlockManager');

  // TODO Make delay configurable
  final StreamController<BlockEvent> _controller = StreamController.broadcast();

  bool _init = true;

  /// Get stream of [BlockEvent]s.
  Stream<BlockEvent> get events => _controller.stream;

  /// Check if [BlockFlow] of give type [T] is registered
  bool exists<T extends BlockFlow>() =>
      _builders.containsKey(typeOf<T>().toString());

  void register<T extends BlockFlow>(BlockFlowBuilder builder) {
    assert(
      !exists<T>(),
      '$BlockManager: $BlockFlow for type '
      '[${typeOf<T>()}] already registered',
    );

    _builders['${typeOf<T>()}'] = builder;
    _log.info(
      '$BlockFlow for type [${typeOf<T>()}] registered',
    );
  }

  Future<void> start() async {
    assert(_init, '$BlockManager is started already');
    final flows = ref.read(flowManagerProvider);
    for (final model in await ref.read(blockRepositoryProvider).getAll()) {
      final type = model.type;
      final builder = _builders[type];
      if (builder == null) {
        _log.warning('No builder found for type ${model.type}');
        continue;
      }
      final flow = builder(ref, model.id);
      await flow.init();
      flows.register(flow);
    }
    _init = false;
    _log.info('$BlockManager initialized');
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
    _log.info(
      '$BlockModel[${data.id}] '
      '${exists.isPresent ? 'updated' : 'added'}',
    );
    return result.isNotEmpty;
  }

  Future<bool> delete(String id) async {
    final repo = ref.read(blockRepositoryProvider);
    final block = await repo.get(id);
    if (!block.isPresent) return false;
    final flows = ref.read(flowManagerProvider);
    flows.unregister(BlockFlow.toKey(id));
    final deleted = await repo.removeAll([block.value]);
    if (deleted.isNotEmpty) {
      final event = BlockDeletedEvent(
        flow: BlockFlow.toKey(id),
        model: block.value,
      );
      _controller.add(event);
    }
    _log.info('$BlockModel[$id] was deleted');
    return deleted.isNotEmpty;
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
Stream<BlockModel> blockModelFlow(Ref ref, BlockFlowQuery query) async* {
  final manager = ref.watch(flowManagerProvider);
  final repo = ref.watch(blockRepositoryProvider);
  final model = await repo.get(query.id);
  if (model.isPresent) {
    yield model.value;
  }
  final service = ref.watch(blockManagerProvider);
  final stream = StreamGroup.merge([
    service.events,
    manager.events.whereType<BlockEvent>().where(query.when),
  ]);
  await for (final event in stream) {
    yield event.model;
  }
}

@Riverpod(keepAlive: true)
BlockManager blockManager(Ref ref) => BlockManager(ref);
