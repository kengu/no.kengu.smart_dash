// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_dash_theme_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeChangedHash() => r'1fc7c8e1e80d0f6e276e03ac8d07ad8ef633d040';

/// See also [themeChanged].
@ProviderFor(themeChanged)
final themeChangedProvider = AutoDisposeProvider<SettingMap>.internal(
  themeChanged,
  name: r'themeChangedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeChangedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThemeChangedRef = AutoDisposeProviderRef<SettingMap>;
String _$smartDashAppThemeControllerHash() =>
    r'50390e1cc92cc36761d7874d3d6b69a6e3e206e2';

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

abstract class _$SmartDashAppThemeController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<SettingMap>> {
  late final SmartDashAppThemeQuery query;

  FutureOr<Optional<SettingMap>> build(
    SmartDashAppThemeQuery query,
  );
}

/// See also [SmartDashAppThemeController].
@ProviderFor(SmartDashAppThemeController)
const smartDashAppThemeControllerProvider = SmartDashAppThemeControllerFamily();

/// See also [SmartDashAppThemeController].
class SmartDashAppThemeControllerFamily extends Family {
  /// See also [SmartDashAppThemeController].
  const SmartDashAppThemeControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'smartDashAppThemeControllerProvider';

  /// See also [SmartDashAppThemeController].
  SmartDashAppThemeControllerProvider call(
    SmartDashAppThemeQuery query,
  ) {
    return SmartDashAppThemeControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  SmartDashAppThemeControllerProvider getProviderOverride(
    covariant SmartDashAppThemeControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SmartDashAppThemeController Function() create) {
    return _$SmartDashAppThemeControllerFamilyOverride(this, create);
  }
}

class _$SmartDashAppThemeControllerFamilyOverride implements FamilyOverride {
  _$SmartDashAppThemeControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final SmartDashAppThemeController Function() create;

  @override
  final SmartDashAppThemeControllerFamily overriddenFamily;

  @override
  SmartDashAppThemeControllerProvider getProviderOverride(
    covariant SmartDashAppThemeControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SmartDashAppThemeController].
class SmartDashAppThemeControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SmartDashAppThemeController,
        Optional<SettingMap>> {
  /// See also [SmartDashAppThemeController].
  SmartDashAppThemeControllerProvider(
    SmartDashAppThemeQuery query,
  ) : this._internal(
          () => SmartDashAppThemeController()..query = query,
          from: smartDashAppThemeControllerProvider,
          name: r'smartDashAppThemeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$smartDashAppThemeControllerHash,
          dependencies: SmartDashAppThemeControllerFamily._dependencies,
          allTransitiveDependencies:
              SmartDashAppThemeControllerFamily._allTransitiveDependencies,
          query: query,
        );

  SmartDashAppThemeControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final SmartDashAppThemeQuery query;

  @override
  FutureOr<Optional<SettingMap>> runNotifierBuild(
    covariant SmartDashAppThemeController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SmartDashAppThemeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SmartDashAppThemeControllerProvider._internal(
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
  (SmartDashAppThemeQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SmartDashAppThemeController,
      Optional<SettingMap>> createElement() {
    return _SmartDashAppThemeControllerProviderElement(this);
  }

  SmartDashAppThemeControllerProvider _copyWith(
    SmartDashAppThemeController Function() create,
  ) {
    return SmartDashAppThemeControllerProvider._internal(
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
    return other is SmartDashAppThemeControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SmartDashAppThemeControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<SettingMap>> {
  /// The parameter `query` of this provider.
  SmartDashAppThemeQuery get query;
}

class _SmartDashAppThemeControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SmartDashAppThemeController,
        Optional<SettingMap>> with SmartDashAppThemeControllerRef {
  _SmartDashAppThemeControllerProviderElement(super.provider);

  @override
  SmartDashAppThemeQuery get query =>
      (origin as SmartDashAppThemeControllerProvider).query;
}

String _$platformBrightnessNotifierHash() =>
    r'edb2d876ae0a9234eaab0a05de38560de26a5017';

/// See also [PlatformBrightnessNotifier].
@ProviderFor(PlatformBrightnessNotifier)
final platformBrightnessNotifierProvider = AutoDisposeNotifierProvider<
    PlatformBrightnessNotifier, Brightness>.internal(
  PlatformBrightnessNotifier.new,
  name: r'platformBrightnessNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$platformBrightnessNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlatformBrightnessNotifier = AutoDisposeNotifier<Brightness>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
