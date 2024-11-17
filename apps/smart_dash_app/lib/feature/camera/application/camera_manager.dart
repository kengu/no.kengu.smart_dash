import 'dart:async';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/feature/camera/application/camera_driver.dart';
import 'package:smart_dash_app/feature/camera/data/snapshot_repository.dart';
import 'package:smart_dash_app/feature/camera/domain/camera.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
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

  Optional<ServiceConfig> find(Camera device) {
    return configs
        .where((e) => e.key == device.service && e.id == device.name)
        .firstOptional;
  }

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
        final snapshot = await repo.addOrUpdate(Snapshot.of(e));
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

  /*

  Future<Optional<CameraSnapshot>> getSnapshot(Camera device) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }

    return get(found.value).getSnapshot();
  }


  Stream<CameraSnapshot> getSnapshotAsStream(Camera device,
      {Duration period = CameraDriver.period}) async* {
    final stream = StreamGroup.merge(
      drivers.map(
        (e) => e.events
            .whereType<CameraSnapshotEvent>()
            .where((e) => e.service == device.service && e.name == device.name)
            .throttle(period),
      ),
    );

    await for (final it in stream) {
      yield it.snapshot;
    }
  }

  Stream<CameraSnapshot> getSnapshotsAsStream({
    Duration period = CameraDriver.period,
  }) {
    return StreamGroup.merge(
      drivers.map(
        (e) => e.getSnapshotAsStream(period: period),
      ),
    );
  }


   */
}

@Riverpod(keepAlive: true)
CameraManager cameraManager(CameraManagerRef ref) =>
    CameraManager(ref, withStorage: true);
