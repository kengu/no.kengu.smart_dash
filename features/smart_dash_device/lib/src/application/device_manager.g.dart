// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceManagerHash() => r'd5c91584d3241be575a83093a67967e6c5cdb15f';

/// See also [deviceManager].
@ProviderFor(deviceManager)
final deviceManagerProvider = Provider<DeviceManager>.internal(
  deviceManager,
  name: r'deviceManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceManagerRef = ProviderRef<DeviceManager>;
String _$driverUpdatedHash() => r'69ee4b474d1375822030a2540c574cb6d8be1db8';

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
