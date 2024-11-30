import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:universal_io/io.dart';

part 'flutter_dirs.g.dart';

@Riverpod(keepAlive: true)
class FlutterDirs extends _$FlutterDirs implements SystemDirs {
  late final Directory _cacheDir;
  late final Directory _documentsDir;
  late final Directory _supportDir;
  late final Directory _tempDir;

  static Future<SystemDirs> init(Ref ref) async {
    return ref.read(flutterDirsProvider.future);
  }

  @override
  Directory get tempDir => _tempDir;

  @override
  Directory get cacheDir => _cacheDir;

  @override
  Directory get supportDir => _supportDir;

  @override
  Directory get documentsDir => _documentsDir;

  @override
  Directory? get downloadsDir => _documentsDir;

  @override
  Future<SystemDirs> build() async {
    _tempDir = await getTemporaryDirectory();
    _cacheDir = await getApplicationCacheDirectory();
    _supportDir = await getApplicationSupportDirectory();
    _documentsDir = await getApplicationDocumentsDirectory();
    systemDirsBuilder(() => this);
    return this;
  }
}
