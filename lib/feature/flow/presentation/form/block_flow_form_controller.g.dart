// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_flow_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockFlowFormControllerHash() =>
    r'1e6e73f42663326030f4ddb3a172d15e63188f12';

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

abstract class _$BlockFlowFormController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<BlockModel>> {
  late final BlockFlowFormQuery query;

  FutureOr<Optional<BlockModel>> build(
    BlockFlowFormQuery query,
  );
}

/// See also [BlockFlowFormController].
@ProviderFor(BlockFlowFormController)
const blockFlowFormControllerProvider = BlockFlowFormControllerFamily();

/// See also [BlockFlowFormController].
class BlockFlowFormControllerFamily extends Family {
  /// See also [BlockFlowFormController].
  const BlockFlowFormControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'blockFlowFormControllerProvider';

  /// See also [BlockFlowFormController].
  BlockFlowFormControllerProvider call(
    BlockFlowFormQuery query,
  ) {
    return BlockFlowFormControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  BlockFlowFormControllerProvider getProviderOverride(
    covariant BlockFlowFormControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(BlockFlowFormController Function() create) {
    return _$BlockFlowFormControllerFamilyOverride(this, create);
  }
}

class _$BlockFlowFormControllerFamilyOverride implements FamilyOverride {
  _$BlockFlowFormControllerFamilyOverride(this.overriddenFamily, this.create);

  final BlockFlowFormController Function() create;

  @override
  final BlockFlowFormControllerFamily overriddenFamily;

  @override
  BlockFlowFormControllerProvider getProviderOverride(
    covariant BlockFlowFormControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [BlockFlowFormController].
class BlockFlowFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BlockFlowFormController,
        Optional<BlockModel>> {
  /// See also [BlockFlowFormController].
  BlockFlowFormControllerProvider(
    BlockFlowFormQuery query,
  ) : this._internal(
          () => BlockFlowFormController()..query = query,
          from: blockFlowFormControllerProvider,
          name: r'blockFlowFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockFlowFormControllerHash,
          dependencies: BlockFlowFormControllerFamily._dependencies,
          allTransitiveDependencies:
              BlockFlowFormControllerFamily._allTransitiveDependencies,
          query: query,
        );

  BlockFlowFormControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final BlockFlowFormQuery query;

  @override
  FutureOr<Optional<BlockModel>> runNotifierBuild(
    covariant BlockFlowFormController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(BlockFlowFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BlockFlowFormControllerProvider._internal(
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
  (BlockFlowFormQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BlockFlowFormController,
      Optional<BlockModel>> createElement() {
    return _BlockFlowFormControllerProviderElement(this);
  }

  BlockFlowFormControllerProvider _copyWith(
    BlockFlowFormController Function() create,
  ) {
    return BlockFlowFormControllerProvider._internal(
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
    return other is BlockFlowFormControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BlockFlowFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<BlockModel>> {
  /// The parameter `query` of this provider.
  BlockFlowFormQuery get query;
}

class _BlockFlowFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BlockFlowFormController,
        Optional<BlockModel>> with BlockFlowFormControllerRef {
  _BlockFlowFormControllerProviderElement(super.provider);

  @override
  BlockFlowFormQuery get query =>
      (origin as BlockFlowFormControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
