// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_form_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsFormScreenControllerHash() =>
    r'024f12367576c266f6e585026150e985a50f5951';

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

abstract class _$SettingsFormScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<SettingMap>> {
  late final SettingsQuery query;

  FutureOr<Optional<SettingMap>> build(
    SettingsQuery query,
  );
}

/// See also [SettingsFormScreenController].
@ProviderFor(SettingsFormScreenController)
const settingsFormScreenControllerProvider =
    SettingsFormScreenControllerFamily();

/// See also [SettingsFormScreenController].
class SettingsFormScreenControllerFamily extends Family {
  /// See also [SettingsFormScreenController].
  const SettingsFormScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'settingsFormScreenControllerProvider';

  /// See also [SettingsFormScreenController].
  SettingsFormScreenControllerProvider call(
    SettingsQuery query,
  ) {
    return SettingsFormScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  SettingsFormScreenControllerProvider getProviderOverride(
    covariant SettingsFormScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SettingsFormScreenController Function() create) {
    return _$SettingsFormScreenControllerFamilyOverride(this, create);
  }
}

class _$SettingsFormScreenControllerFamilyOverride implements FamilyOverride {
  _$SettingsFormScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final SettingsFormScreenController Function() create;

  @override
  final SettingsFormScreenControllerFamily overriddenFamily;

  @override
  SettingsFormScreenControllerProvider getProviderOverride(
    covariant SettingsFormScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SettingsFormScreenController].
class SettingsFormScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SettingsFormScreenController,
        Optional<SettingMap>> {
  /// See also [SettingsFormScreenController].
  SettingsFormScreenControllerProvider(
    SettingsQuery query,
  ) : this._internal(
          () => SettingsFormScreenController()..query = query,
          from: settingsFormScreenControllerProvider,
          name: r'settingsFormScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsFormScreenControllerHash,
          dependencies: SettingsFormScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              SettingsFormScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  SettingsFormScreenControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final SettingsQuery query;

  @override
  FutureOr<Optional<SettingMap>> runNotifierBuild(
    covariant SettingsFormScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SettingsFormScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SettingsFormScreenControllerProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  (SettingsQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SettingsFormScreenController,
      Optional<SettingMap>> createElement() {
    return _SettingsFormScreenControllerProviderElement(this);
  }

  SettingsFormScreenControllerProvider _copyWith(
    SettingsFormScreenController Function() create,
  ) {
    return SettingsFormScreenControllerProvider._internal(
      () => create()..query = query,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      query: query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsFormScreenControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SettingsFormScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<SettingMap>> {
  /// The parameter `query` of this provider.
  SettingsQuery get query;
}

class _SettingsFormScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SettingsFormScreenController,
        Optional<SettingMap>> with SettingsFormScreenControllerRef {
  _SettingsFormScreenControllerProviderElement(super.provider);

  @override
  SettingsQuery get query =>
      (origin as SettingsFormScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
