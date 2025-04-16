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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoryManagerRef = ProviderRef<HistoryManager>;
String _$historyHash() => r'96509ad72954ffff7b11019de5d334ff5e4ee78f';

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
class HistoryFamily extends Family<AsyncValue<HistoryEvent>> {
  /// See also [history].
  const HistoryFamily();

  /// See also [history].
  HistoryProvider call([
    Token? token,
  ]) {
    return HistoryProvider(
      token,
    );
  }

  @override
  HistoryProvider getProviderOverride(
    covariant HistoryProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'historyProvider';
}

/// See also [history].
class HistoryProvider extends StreamProvider<HistoryEvent> {
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
    super._createNotifier, {
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
    Stream<HistoryEvent> Function(HistoryRef provider) create,
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
  StreamProviderElement<HistoryEvent> createElement() {
    return _HistoryProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HistoryRef on StreamProviderRef<HistoryEvent> {
  /// The parameter `token` of this provider.
  Token? get token;
}

class _HistoryProviderElement extends StreamProviderElement<HistoryEvent>
    with HistoryRef {
  _HistoryProviderElement(super.provider);

  @override
  Token? get token => (origin as HistoryProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
