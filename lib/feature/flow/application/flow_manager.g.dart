// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flowManagerHash() => r'756838274d1ee4e619dd14e152c8385c709e0ccd';

/// See also [flowManager].
@ProviderFor(flowManager)
final flowManagerProvider = Provider<FlowManager>.internal(
  flowManager,
  name: r'flowManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$flowManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlowManagerRef = ProviderRef<FlowManager>;
String _$flowHash() => r'9a05f66cce08296259b4dc96e6e3c14954ec74f8';

/// See also [flow].
@ProviderFor(flow)
final flowProvider = AutoDisposeStreamProvider<FlowEvent>.internal(
  flow,
  name: r'flowProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$flowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlowRef = AutoDisposeStreamProviderRef<FlowEvent>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
