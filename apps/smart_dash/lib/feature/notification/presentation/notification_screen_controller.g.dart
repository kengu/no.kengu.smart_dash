// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationScreenControllerHash() =>
    r'84c4fff6d7cf0a4f7ccb0445cd6ba532fde316fc';

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

abstract class _$NotificationScreenController
    extends BuildlessAutoDisposeAsyncNotifier<
        Optional<List<NotificationModel>>> {
  late final NotificationQuery query;

  FutureOr<Optional<List<NotificationModel>>> build(
    NotificationQuery query,
  );
}

/// See also [NotificationScreenController].
@ProviderFor(NotificationScreenController)
const notificationScreenControllerProvider =
    NotificationScreenControllerFamily();

/// See also [NotificationScreenController].
class NotificationScreenControllerFamily extends Family {
  /// See also [NotificationScreenController].
  const NotificationScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'notificationScreenControllerProvider';

  /// See also [NotificationScreenController].
  NotificationScreenControllerProvider call(
    NotificationQuery query,
  ) {
    return NotificationScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  NotificationScreenControllerProvider getProviderOverride(
    covariant NotificationScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(NotificationScreenController Function() create) {
    return _$NotificationScreenControllerFamilyOverride(this, create);
  }
}

class _$NotificationScreenControllerFamilyOverride implements FamilyOverride {
  _$NotificationScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final NotificationScreenController Function() create;

  @override
  final NotificationScreenControllerFamily overriddenFamily;

  @override
  NotificationScreenControllerProvider getProviderOverride(
    covariant NotificationScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [NotificationScreenController].
class NotificationScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NotificationScreenController,
        Optional<List<NotificationModel>>> {
  /// See also [NotificationScreenController].
  NotificationScreenControllerProvider(
    NotificationQuery query,
  ) : this._internal(
          () => NotificationScreenController()..query = query,
          from: notificationScreenControllerProvider,
          name: r'notificationScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationScreenControllerHash,
          dependencies: NotificationScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              NotificationScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  NotificationScreenControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final NotificationQuery query;

  @override
  FutureOr<Optional<List<NotificationModel>>> runNotifierBuild(
    covariant NotificationScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(NotificationScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: NotificationScreenControllerProvider._internal(
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
  (NotificationQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NotificationScreenController,
      Optional<List<NotificationModel>>> createElement() {
    return _NotificationScreenControllerProviderElement(this);
  }

  NotificationScreenControllerProvider _copyWith(
    NotificationScreenController Function() create,
  ) {
    return NotificationScreenControllerProvider._internal(
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
    return other is NotificationScreenControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotificationScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<NotificationModel>>> {
  /// The parameter `query` of this provider.
  NotificationQuery get query;
}

class _NotificationScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        NotificationScreenController, Optional<List<NotificationModel>>>
    with NotificationScreenControllerRef {
  _NotificationScreenControllerProviderElement(super.provider);

  @override
  NotificationQuery get query =>
      (origin as NotificationScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
