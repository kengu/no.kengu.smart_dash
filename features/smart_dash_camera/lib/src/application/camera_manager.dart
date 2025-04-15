import 'dart:async';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'camera_manager.g.dart';

class CameraManager extends DriverManager<CameraDriver> {
  CameraManager(
    super.ref, {
    required this.withStorage,
    this.storagePeriod = CameraDriver.period,
  });

  final bool withStorage;
  final Duration storagePeriod;

  final _log = Logger('$CameraManager');

  StreamSubscription? _storageSubscription;

  bool get isStorageEnabled => _storageSubscription != null;

  bool enableStorage([Duration period = CameraDriver.period]) {
    if (!isStorageEnabled) {
      final stream = StreamGroup.merge(drivers.map(
        (e) => e.events.whereType<CameraSnapshotEvent>().throttle(period),
      ));
      _storageSubscription = stream.listen(
        _writeSnapshot,
        cancelOnError: false,
      );
    }
    return isStorageEnabled;
  }

  bool disableStorage() {
    if (!isStorageEnabled) return false;
    _storageSubscription?.cancel();
    _storageSubscription = null;
    return true;
  }

  void _writeSnapshot(CameraSnapshotEvent e) {
    guard(
      () async {
        final repo = ref.read(snapshotRepositoryProvider);
        final snapshot = await repo.upsert(Snapshot.of(e));
        final file = repo.toFile(repo.toId(snapshot.item));
        _log.fine(
          'Saved snapshot from '
          'camera [${e.service}:${e.name}] to [${file.path}]',
        );
      },
      task: '_writeSnapshot',
      name: '$CameraManager',
    );
  }
}

@Riverpod(keepAlive: true)
CameraManager cameraManager(CameraManagerRef ref) =>
    CameraManager(ref, withStorage: true);
