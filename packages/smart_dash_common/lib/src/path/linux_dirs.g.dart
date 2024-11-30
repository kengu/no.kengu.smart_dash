// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linux_dirs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$linuxDirsHash() => r'092f939ed901a225fbf255b48d634ddd731340ae';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LinuxDirs
    extends BuildlessAutoDisposeAsyncNotifier<SystemDirs> {
  late final String? applicationId;

  FutureOr<SystemDirs> build({
    String? applicationId,
  });
}

/// See also [LinuxDirs].
@ProviderFor(LinuxDirs)
const linuxDirsProvider = LinuxDirsFamily();

/// See also [LinuxDirs].
class LinuxDirsFamily extends Family {
  /// See also [LinuxDirs].
  const LinuxDirsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'linuxDirsProvider';

  /// See also [LinuxDirs].
  LinuxDirsProvider call({
    String? applicationId,
  }) {
    return LinuxDirsProvider(
      applicationId: applicationId,
    );
  }

  @visibleForOverriding
  @override
  LinuxDirsProvider getProviderOverride(
    covariant LinuxDirsProvider provider,
  ) {
    return call(
      applicationId: provider.applicationId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(LinuxDirs Function() create) {
    return _$LinuxDirsFamilyOverride(this, create);
  }
}

class _$LinuxDirsFamilyOverride implements FamilyOverride {
  _$LinuxDirsFamilyOverride(this.overriddenFamily, this.create);

  final LinuxDirs Function() create;

  @override
  final LinuxDirsFamily overriddenFamily;

  @override
  LinuxDirsProvider getProviderOverride(
    covariant LinuxDirsProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [LinuxDirs].
class LinuxDirsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LinuxDirs, SystemDirs> {
  /// See also [LinuxDirs].
  LinuxDirsProvider({
    String? applicationId,
  }) : this._internal(
          () => LinuxDirs()..applicationId = applicationId,
          from: linuxDirsProvider,
          name: r'linuxDirsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$linuxDirsHash,
          dependencies: LinuxDirsFamily._dependencies,
          allTransitiveDependencies: LinuxDirsFamily._allTransitiveDependencies,
          applicationId: applicationId,
        );

  LinuxDirsProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final String? applicationId;

  @override
  FutureOr<SystemDirs> runNotifierBuild(
    covariant LinuxDirs notifier,
  ) {
    return notifier.build(
      applicationId: applicationId,
    );
  }

  @override
  Override overrideWith(LinuxDirs Function() create) {
    return ProviderOverride(
      origin: this,
      override: LinuxDirsProvider._internal(
        () => create()..applicationId = applicationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        applicationId: applicationId,
      ),
    );
  }

  @override
  ({
    String? applicationId,
  }) get argument {
    return (applicationId: applicationId,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LinuxDirs, SystemDirs>
      createElement() {
    return _LinuxDirsProviderElement(this);
  }

  LinuxDirsProvider _copyWith(
    LinuxDirs Function() create,
  ) {
    return LinuxDirsProvider._internal(
      () => create()..applicationId = applicationId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      applicationId: applicationId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LinuxDirsProvider && other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LinuxDirsRef on AutoDisposeAsyncNotifierProviderRef<SystemDirs> {
  /// The parameter `applicationId` of this provider.
  String? get applicationId;
}

class _LinuxDirsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LinuxDirs, SystemDirs>
    with LinuxDirsRef {
  _LinuxDirsProviderElement(super.provider);

  @override
  String? get applicationId => (origin as LinuxDirsProvider).applicationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
