import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'snow_state_repository.g.dart';

class SnowStateRepository extends BulkHiveRepository<String, SnowState> {
  SnowStateRepository(super.ref)
      : super(
          key: 'snow',
          box: 'state',
          adapter: SnowStateAdapter(),
        );

  @override
  String toKey(String id) => id;

  @override
  String toId(SnowState item) => item.location;
}

@Riverpod(keepAlive: true)
SnowStateRepository snowStateRepository(Ref ref) {
  return SnowStateRepository(ref);
}

class SnowStateAdapter extends TypedAdapter<SnowState> {
  SnowStateAdapter() : super(HiveTypeId.snowState);

  @override
  SnowState read(BinaryReader reader) {
    return SnowState.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, SnowState obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
