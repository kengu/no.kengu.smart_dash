import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:universal_io/io.dart';

class NativeDirs extends SystemDirs {
  NativeDirs({
    required this.tempDir,
    required this.cacheDir,
    required this.supportDir,
    required this.documentsDir,
    required this.downloadsDir,
  });

  @override
  final Directory tempDir;

  @override
  final Directory cacheDir;

  @override
  final Directory supportDir;

  @override
  final Directory documentsDir;

  @override
  final Directory downloadsDir;

  Future<List<Directory>> create() {
    return Future.wait([
      tempDir.create(recursive: true),
      cacheDir.create(recursive: true),
      supportDir.create(recursive: true),
      documentsDir.create(recursive: true),
      downloadsDir.create(recursive: true),
    ]);
  }

  void createSync() {
    tempDir.createSync(recursive: true);
    cacheDir.createSync(recursive: true);
    supportDir.createSync(recursive: true);
    documentsDir.createSync(recursive: true);
    downloadsDir.createSync(recursive: true);
  }
}
