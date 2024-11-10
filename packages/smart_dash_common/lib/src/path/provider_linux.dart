import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'linux_dirs.dart';

/// Get [SystemDirs] from given [ref].
///
/// This resolves
SystemDirs systemDirs(Ref ref, {String? applicationId}) {
  final request = ref.read(linuxDirsProvider(applicationId: applicationId));
  final value = request.whenData((data) => data);
  assert(
    value.hasValue,
    'SystemDirs not found. '
    'Did you forget to register '
    'flutterDirsProvider or linuxDirsProvider?',
  );
  return value.requireValue;
}
