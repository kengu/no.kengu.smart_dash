import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'flutter_dirs.dart';

/// Get [SystemDirs] from given [ref].
///
/// This resolves
SystemDirs systemDirs(Ref ref) {
  final request = ref.read(flutterDirsProvider);
  final value = request.whenData((data) => data);
  assert(
    value.hasValue,
    'SystemDirs not found. '
    'Did you forget to register flutterDirsProvider?',
  );
  return value.requireValue;
}
