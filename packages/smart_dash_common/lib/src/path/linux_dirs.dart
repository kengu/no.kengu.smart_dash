import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:universal_io/io.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

part 'linux_dirs.g.dart';

// Adapted from https://github.com/flutter/packages/blob/main/packages/path_provider/path_provider_linux/lib/src/path_provider_linux.dart
@riverpod
class LinuxDirs extends _$LinuxDirs implements SystemDirs {
  late final Directory _cacheDir;
  late final Directory _supportDir;
  late final String? _applicationId;

  String? _executableName;

  @override
  Directory get cacheDir => _cacheDir;

  @override
  Directory get supportDir => _supportDir;

  @override
  Directory get documentsDir => xdg.getUserDirectory('DOCUMENTS')!;

  @override
  Directory? get downloadsDir => xdg.getUserDirectory('DOWNLOAD');

  @override
  Directory get tempDir {
    final String environmentTmpDir = Platform.environment['TMPDIR'] ?? '';
    return Directory(
      environmentTmpDir.isEmpty ? '/tmp' : environmentTmpDir,
    );
  }

  @override
  Future<SystemDirs> build({
    String? applicationId,
  }) async {
    _applicationId = applicationId;
    _supportDir = await _getSupportPath();
    _cacheDir = await _getApplicationCachePath();
    return this;
  }

  Future<Directory> _getSupportPath() async {
    final Directory directory = Directory(path.join(
      xdg.dataHome.path,
      await _getId(),
    ));
    if (directory.existsSync()) {
      return directory;
    }

    // This plugin originally used the executable name as a directory.
    // Use that if it exists for backwards compatibility.
    final Directory legacyDirectory = Directory(path.join(
      xdg.dataHome.path,
      await _getExecutableName(),
    ));
    if (legacyDirectory.existsSync()) {
      return legacyDirectory;
    }

    // Create the directory, because mobile implementations assume the
    // directory exists.
    await directory.create(recursive: true);
    return directory;
  }

  Future<Directory> _getApplicationCachePath() async {
    final Directory directory = Directory(path.join(
      xdg.cacheHome.path,
      await _getId(),
    ));
    if (!directory.existsSync()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  // Gets the name of this executable.
  Future<String> _getExecutableName() async {
    _executableName ??= path.basenameWithoutExtension(
        await File('/proc/self/exe').resolveSymbolicLinks());
    return _executableName!;
  }

  // Gets the unique ID for this application.
  Future<String> _getId() async {
    // If no application ID then fall back to using the executable name.
    return _applicationId ?? await _getExecutableName();
  }
}
