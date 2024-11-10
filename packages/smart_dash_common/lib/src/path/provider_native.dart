import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_common/src/path/linux_dirs.dart';
import 'package:universal_io/io.dart';

typedef SystemDirsBuilder = ProviderListenable<AsyncValue<SystemDirs>>
    Function();

Optional<SystemDirsBuilder> _builder = Optional.empty();
void systemDirsBuilder(SystemDirsBuilder builder) {
  _builder = Optional.ofNullable(builder);
}

/// Get [SystemDirs] from given [ref].
///
/// This resolves
SystemDirs systemDirs(Ref ref, {String? applicationId}) {
  if (_builder.isPresent) {
    return _get(ref.read(_builder.value()));
  }

  if (Platform.isLinux) {
    return _get(ref.read(
      linuxDirsProvider(applicationId: applicationId),
    ));
  }

  throw 'SystemDirs not found. '
      'Did you forget to register a provider with systemDirsBuilder()?';
}

SystemDirs _get(AsyncValue<SystemDirs> request) {
  final value = request.whenData((data) => data);
  assert(
    value.hasValue,
    'SystemDirs not found. '
    'Did you forget to register a provider with systemDirsBuilder()?',
  );
  return value.requireValue;
}
