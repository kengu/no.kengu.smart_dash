import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

/// Get [SystemDirs] from given [ref].
///
/// This resolves
SystemDirs systemDirs(Ref ref, {String? applicationId}) {
  final request = ref.exists(flutterDirsProvider)
      ? ref.read(flutterDirsProvider)
      : ref.read(linuxDirsProvider(applicationId: applicationId));
  final value = request.whenData((data) => data);
  assert(
    value.hasValue,
    'SystemDirs not found. '
    'Did you forget to register '
    'flutterDirProvider or linuxDirProvider?',
  );
  return value.requireValue;
}
