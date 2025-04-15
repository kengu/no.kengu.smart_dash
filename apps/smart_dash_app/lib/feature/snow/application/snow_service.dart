import 'package:optional/optional_internal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'snow_service.g.dart';

@Riverpod()
Future<Optional<SnowService>> getCurrentSnowService(
    GetCurrentSnowServiceRef ref,
    [String? userId]) async {
  final accounts = ref.watch(accountServiceProvider);
  final home = await accounts.getCurrentHome(userId: userId);

  if (!home.isPresent) {
    return const Optional.empty();
  }

  final baseUrl = home.value.baseUrl ?? 'localhost';
  final service = await ref.watch(snowServiceProvider(baseUrl).future);
  return Optional.of(service);
}
