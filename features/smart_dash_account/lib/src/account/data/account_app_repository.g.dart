// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_app_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appAccountRepositoryHash() =>
    r'fed0ef0ff5844379c00f4a20b2ad7a2dbc1cf8c9';

/// See also [appAccountRepository].
@ProviderFor(appAccountRepository)
final appAccountRepositoryProvider = Provider<AccountAppRepository>.internal(
  appAccountRepository,
  name: r'appAccountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appAccountRepositoryHash,
  dependencies: <ProviderOrFamily>[connectivityProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    connectivityProvider,
    ...?connectivityProvider.allTransitiveDependencies
  },
);

typedef AppAccountRepositoryRef = ProviderRef<AccountAppRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
