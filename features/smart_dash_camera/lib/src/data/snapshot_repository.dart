import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'snapshot_repository.g.dart';

class SnapshotRepository extends FileRepository<String, Snapshot> {
  SnapshotRepository(Ref ref)
      : super(
          ref,
          Directory('snapshots'),
          'binary',
          maxCount: 100,
        );

  @override
  String toId(Snapshot item) => item.name;

  @override
  String toKey(String id) => id;

  @override
  Future<Snapshot> read(File file) async {
    final bytes = await file.readAsBytes();
    final name = p.basenameWithoutExtension(file.path);
    return Snapshot(name, CameraSnapshot(bytes));
  }

  @override
  Future<bool> write(Snapshot item, File file) async {
    await file.writeAsBytes(
      item.snapshot.bytes.toList(),
    );
    return Future.value(true);
  }
}

class Snapshot {
  Snapshot(this.name, this.snapshot);
  final String name;
  final CameraSnapshot snapshot;

  static DateFormat df = DateFormat('yyyyMMdd_HHmmss');

  static Snapshot of(CameraSnapshotEvent e) {
    return Snapshot(
      [
        e.service,
        e.name,
        df.format(e.when),
      ].join('_'),
      e.snapshot,
    );
  }
}

@Riverpod(keepAlive: true)
SnapshotRepository snapshotRepository(SnapshotRepositoryRef ref) {
  return SnapshotRepository(ref);
}
