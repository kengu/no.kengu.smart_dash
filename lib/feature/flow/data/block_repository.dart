import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/hive.dart';

part 'block_repository.g.dart';

const _typeId = 3;

class BlockRepository {
  BlockRepository() {
    if (!Hive.isAdapterRegistered(_typeId)) {
      Hive.registerAdapter(BlockAdapter());
    }
  }

  static const key = 'blocks';

  Future<List<String>> getIds() async {
    return guard(
      () async {
        final box = await _open<BlockModel>('registered');
        return await box.getAllKeys();
      },
      task: 'getIds',
      name: '$BlockRepository',
    );
  }

  Future<List<BlockModel>> getAll() async {
    return await _load();
  }

  Future<List<BlockModel>> where(bool Function(BlockModel element) test) async {
    return (await _load()).where(test).toList();
  }

  Future<Optional<BlockModel>> get(String id) async {
    final blocks = await _load();
    return blocks.isEmpty
        ? const Optional.empty()
        : blocks.firstWhereOptional(
            (block) => block.id == id,
          );
  }

  /// Attempt to sett all given blocks to
  /// repository. Returns list of actual added blocks.
  Future<List<BlockModel>> addOrUpdate(Iterable<BlockModel> blocks) async {
    final unique = blocks.toSet();
    final success = await _putAll([...unique]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given blocks from
  /// repository. Returns list of actual removed blocks.
  Future<List<BlockModel>> removeAll(Iterable<BlockModel> blocks) async {
    final current = await _load();
    final currentIds = current.map((e) => e.id).toList();
    final unique = blocks..toSet().where((e) => currentIds.contains(e.id));
    final success = await _removeAll(unique);
    return [if (success) ...unique];
  }

  Future<CollectionBox<T>> _open<T>(String name) async {
    final db = await openCollection(
      key,
      {'registered'},
    );
    return db.openBox<T>(name);
  }

  Future<List<BlockModel>> _init() async {
    // Initialize default flows
    final flows = await rootBundle
        .loadString('assets/data/default_flows.json')
        .then((json) => jsonDecode(json)) as List;
    return flows.map((e) => e as JsonObject).map(BlockModel.fromJson).toList();
  }

  Future<List<BlockModel>> _load() => guard(
        () async {
          final box = await _open<BlockModel>('registered');
          final result = await box.getAll(await box.getAllKeys());
          final blocks = result.whereType<BlockModel>().toList();
          if (blocks.isNotEmpty) return blocks;
          // Initialize default flows
          return _init();
        },
        task: '_load',
        name: '$BlockRepository',
      );

  Future<bool> _removeAll(Iterable<BlockModel> blocks) => guard(
        () async {
          final box = await _open<BlockModel>('registered');
          final ids = blocks.map((e) => e.id).toList();
          await box.deleteAll(ids);
          return true;
        },
        task: '_removeAll',
        name: '$BlockRepository',
      );

  Future<bool> _putAll(List<BlockModel> blocks) => guard(
        () async {
          final box = await _open<BlockModel>('registered');
          for (final block in blocks) {
            await box.put(block.id, block);
          }
          return true;
        },
        task: '_putAll',
        name: '$BlockRepository',
      );

  Future<void> clear() async {
    return guard(
      () => Hive.deleteBoxFromDisk(
        'blocks_registered',
      ),
      task: 'clear',
      name: '$BlockRepository',
    );
  }
}

@Riverpod(keepAlive: true)
BlockRepository blockRepository(BlockRepositoryRef ref) {
  return BlockRepository();
}

class BlockAdapter extends TypeAdapter<BlockModel> {
  @override
  final typeId = _typeId;

  @override
  BlockModel read(BinaryReader reader) {
    return BlockModel.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, BlockModel obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
