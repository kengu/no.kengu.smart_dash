// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_driver_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceDriverManagerHash() =>
    r'6a9e75dfe3c3221a2d15a2fd1f05eaf6b8e0ec03';

/// See also [deviceDriverManager].
@ProviderFor(deviceDriverManager)
final deviceDriverManagerProvider = Provider<DeviceDriverManager>.internal(
  deviceDriverManager,
  name: r'deviceDriverManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceDriverManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceDriverManagerRef = ProviderRef<DeviceDriverManager>;
String _$driverUpdatedHash() => r'f75a32dd94b95c20968dd99ed73b61e2174ffbff';

/// See also [driverUpdated].
@ProviderFor(driverUpdated)
final driverUpdatedProvider =
    AutoDisposeStreamProvider<DevicesUpdatedEvent>.internal(
  driverUpdated,
  name: r'driverUpdatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$driverUpdatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DriverUpdatedRef = AutoDisposeStreamProviderRef<DevicesUpdatedEvent>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
