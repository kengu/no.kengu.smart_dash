import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'system_dirs.g.dart';

/// Common interface for system paths
abstract class SystemDirs {
  /// Path to the temporary directory on the device that is not
  /// backed up and is suitable for storing caches of downloaded files.
  ///
  /// Files in this directory may be cleared at any time. This does not
  /// return a new temporary directory. Instead, the caller is responsible
  /// for creating (and cleaning up) files or directories within this
  /// directory.
  ///
  /// This directory is scoped to the calling application.
  Directory get tempDir;

  /// Path to a directory where the application may place
  /// application-specific cache files.
  Directory get cacheDir;

  /// Use this for files you don’t want exposed to the user.
  /// Your app should not use this directory for user data files.
  Directory get supportDir;

  /// Path to a directory where the application may place data that
  /// is user-generated, or that cannot otherwise be recreated by
  /// your application.
  Directory get documentsDir;

  /// Path to the directory where downloaded files can be stored.
  ///
  /// The returned directory is not guaranteed to exist, so clients should
  /// verify that it does before using it, and potentially create it
  /// if necessary.
  Directory? get downloadsDir;
}

typedef SystemDirsBuilder = SystemDirs Function();

/// Register [SystemDirs] builder
void systemDirsBuilder(SystemDirsBuilder builder) {
  _builder = Optional.ofNullable(builder);
}

Optional<SystemDirsBuilder> _builder = Optional.empty();

/// Get [SystemDirs]
@riverpod
SystemDirs systemDirs(Ref ref) {
  if (_builder.isPresent) {
    return _builder.value();
  }

  throw 'SystemDirs not found. '
      'Did you forget to register it with systemDirsBuilder()?';
}
