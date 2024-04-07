import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/hive.dart';

part 'block_repository.g.dart';

class BlockRepository extends HiveRepository<String, BlockModel> {
  BlockRepository()
      : super(
          key: 'blocks',
          box: 'registered',
          adapter: BlockAdapter(),
        );

  @override
  String toKey(String id) => id;

  @override
  String toId(BlockModel item) => item.id;

  Future<List<String>> getIds() => getKeys();

  @override
  Future<List<BlockModel>> seed() async {
    // Initialize default flows
    final flows = await rootBundle
        .loadString('assets/data/default_flows.json')
        .then((json) => jsonDecode(json)) as List;
    return flows.map((e) => e as JsonObject).map(BlockModel.fromJson).toList();
  }
}

@Riverpod(keepAlive: true)
BlockRepository blockRepository(BlockRepositoryRef ref) {
  return BlockRepository();
}

class BlockAdapter extends TypedAdapter<BlockModel> {
  BlockAdapter() : super(HiveTypeId.block);

  static final instance = BlockAdapter();

  @override
  BlockModel read(BinaryReader reader) {
    final data = reader.read();
    return BlockModel.fromJson(jsonDecode(
      data,
    ));
  }

  @override
  void write(BinaryWriter writer, BlockModel obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
