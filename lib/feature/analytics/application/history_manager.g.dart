// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyManagerHash() => r'eee3e1b5ea19975d23628a67eb6796b32d751fb9';

/// See also [historyManager].
@ProviderFor(historyManager)
final historyManagerProvider = Provider<HistoryManager>.internal(
  historyManager,
  name: r'historyManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HistoryManagerRef = ProviderRef<HistoryManager>;
String _$historyHash() => r'94f849990d4487901b6b1a2caf219becdb19e3fd';

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

/// See also [history].
@ProviderFor(history)
const historyProvider = HistoryFamily();

/// See also [history].
class HistoryFamily extends Family {
  /// See also [history].
  const HistoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyProvider';

  /// See also [history].
  HistoryProvider call([
    Token? token,
  ]) {
    return HistoryProvider(
      token,
    );
  }

  @visibleForOverriding
  @override
  HistoryProvider getProviderOverride(
    covariant HistoryProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<HistoryEvent> Function(HistoryRef ref) create) {
    return _$HistoryFamilyOverride(this, create);
  }
}

class _$HistoryFamilyOverride implements FamilyOverride {
  _$HistoryFamilyOverride(this.overriddenFamily, this.create);

  final Stream<HistoryEvent> Function(HistoryRef ref) create;

  @override
  final HistoryFamily overriddenFamily;

  @override
  HistoryProvider getProviderOverride(
    covariant HistoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [history].
class HistoryProvider extends AutoDisposeStreamProvider<HistoryEvent> {
  /// See also [history].
  HistoryProvider([
    Token? token,
  ]) : this._internal(
          (ref) => history(
            ref as HistoryRef,
            token,
          ),
          from: historyProvider,
          name: r'historyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$historyHash,
          dependencies: HistoryFamily._dependencies,
          allTransitiveDependencies: HistoryFamily._allTransitiveDependencies,
          token: token,
        );

  HistoryProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final Token? token;

  @override
  Override overrideWith(
    Stream<HistoryEvent> Function(HistoryRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HistoryProvider._internal(
        (ref) => create(ref as HistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  (Token?,) get argument {
    return (token,);
  }

  @override
  AutoDisposeStreamProviderElement<HistoryEvent> createElement() {
    return _HistoryProviderElement(this);
  }

  HistoryProvider _copyWith(
    Stream<HistoryEvent> Function(HistoryRef ref) create,
  ) {
    return HistoryProvider._internal(
      (ref) => create(ref as HistoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      token: token,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HistoryRef on AutoDisposeStreamProviderRef<HistoryEvent> {
  /// The parameter `token` of this provider.
  Token? get token;
}

class _HistoryProviderElement
    extends AutoDisposeStreamProviderElement<HistoryEvent> with HistoryRef {
  _HistoryProviderElement(super.provider);

  @override
  Token? get token => (origin as HistoryProvider).token;
}

String _$powerHistoryHash() => r'9713f50750a2a2c9d7c02c692302d1f044f60b03';

/// See also [powerHistory].
@ProviderFor(powerHistory)
final powerHistoryProvider = AutoDisposeStreamProvider<HistoryEvent>.internal(
  powerHistory,
  name: r'powerHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$powerHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PowerHistoryRef = AutoDisposeStreamProviderRef<HistoryEvent>;
String _$energyHistoryHash() => r'abd78d3ecbdb3a71524dbf75c4c781222f32c7fd';

/// See also [energyHistory].
@ProviderFor(energyHistory)
final energyHistoryProvider = AutoDisposeStreamProvider<HistoryEvent>.internal(
  energyHistory,
  name: r'energyHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$energyHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnergyHistoryRef = AutoDisposeStreamProviderRef<HistoryEvent>;
String _$voltageHistoryHash() => r'15df348c9e659e8a5c867646f46a1f854e58fc89';

/// See also [voltageHistory].
@ProviderFor(voltageHistory)
final voltageHistoryProvider = AutoDisposeStreamProvider<HistoryEvent>.internal(
  voltageHistory,
  name: r'voltageHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voltageHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VoltageHistoryRef = AutoDisposeStreamProviderRef<HistoryEvent>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
