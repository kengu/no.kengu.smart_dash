// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyManagerHash() => r'f7481aa4fdb64892f4fd125c2dfed4ff147a3b54';

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
String _$historyHash() => r'd92d8201401a022267e785d5050c0d4aad483b82';

/// See also [history].
@ProviderFor(history)
final historyProvider = AutoDisposeStreamProvider<HistoryEvent>.internal(
  history,
  name: r'historyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$historyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HistoryRef = AutoDisposeStreamProviderRef<HistoryEvent>;
String _$powerHistoryHash() => r'7a677b3bba4753d4155a225576192df8499feb38';

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
String _$energyHistoryHash() => r'6cdeb0b052272618167aef94557c081ea456f696';

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
String _$voltageHistoryHash() => r'900541539c082de44fa62bfcef985cd06182e275';

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
