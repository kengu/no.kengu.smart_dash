// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_form_screen_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsFormScreenViewModelHash() =>
    r'1be652c59658fa89a3ed51549984167ef8ecc004';

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

abstract class _$SettingsFormScreenViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Optional<SettingMap>> {
  late final SettingsQuery query;

  FutureOr<Optional<SettingMap>> build(
    SettingsQuery query,
  );
}

/// See also [SettingsFormScreenViewModel].
@ProviderFor(SettingsFormScreenViewModel)
const settingsFormScreenViewModelProvider = SettingsFormScreenViewModelFamily();

/// See also [SettingsFormScreenViewModel].
class SettingsFormScreenViewModelFamily
    extends Family<AsyncValue<Optional<SettingMap>>> {
  /// See also [SettingsFormScreenViewModel].
  const SettingsFormScreenViewModelFamily();

  /// See also [SettingsFormScreenViewModel].
  SettingsFormScreenViewModelProvider call(
    SettingsQuery query,
  ) {
    return SettingsFormScreenViewModelProvider(
      query,
    );
  }

  @override
  SettingsFormScreenViewModelProvider getProviderOverride(
    covariant SettingsFormScreenViewModelProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'settingsFormScreenViewModelProvider';
}

/// See also [SettingsFormScreenViewModel].
class SettingsFormScreenViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SettingsFormScreenViewModel,
        Optional<SettingMap>> {
  /// See also [SettingsFormScreenViewModel].
  SettingsFormScreenViewModelProvider(
    SettingsQuery query,
  ) : this._internal(
          () => SettingsFormScreenViewModel()..query = query,
          from: settingsFormScreenViewModelProvider,
          name: r'settingsFormScreenViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsFormScreenViewModelHash,
          dependencies: SettingsFormScreenViewModelFamily._dependencies,
          allTransitiveDependencies:
              SettingsFormScreenViewModelFamily._allTransitiveDependencies,
          query: query,
        );

  SettingsFormScreenViewModelProvider._internal(
    super._createNotifier, {
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
    covariant SettingsFormScreenViewModel notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SettingsFormScreenViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SettingsFormScreenViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SettingsFormScreenViewModel,
      Optional<SettingMap>> createElement() {
    return _SettingsFormScreenViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsFormScreenViewModelProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SettingsFormScreenViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<SettingMap>> {
  /// The parameter `query` of this provider.
  SettingsQuery get query;
}

class _SettingsFormScreenViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SettingsFormScreenViewModel,
        Optional<SettingMap>> with SettingsFormScreenViewModelRef {
  _SettingsFormScreenViewModelProviderElement(super.provider);

  @override
  SettingsQuery get query =>
      (origin as SettingsFormScreenViewModelProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
