/*
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/util/hive.dart';

class SnapshotRepository extends HiveRepository<String, CameraSnapshot> {
  SnapshotRepository()
      : super(
          key: 'snapshots',
          box: 'registered',
          adapter: SnapshotAdapter(),
        );

  @override
  String toId(CameraSnapshot item) => item.name;

  @override
  String toKey(String id) => id;
}

class SnapshotAdapter extends TypedAdapter<CameraSnapshot> {
  SnapshotAdapter() : super(HiveTypeId.snapshot);

  @override
  CameraSnapshot read(BinaryReader reader) {
    final json = jsonDecode(reader.read());
    return CameraSnapshot.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, CameraSnapshot obj) {
    writer.write(obj.bytes);
  }
}
*/
