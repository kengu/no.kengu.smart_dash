import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'account_client.g.dart';

class AccountClient extends RepositoryClient<String, Account>
    with BulkRepositoryClientMixin<String, Account> {
  AccountClient(Dio api) : super(api, 'account');

  @override
  String toId(Account item) {
    return item.userId;
  }

  @override
  Account toItem(JsonObject data) {
    return Account.fromJson(data);
  }
}

@Riverpod(keepAlive: true)
AccountClient accountClient(AccountClientRef ref, String baseUrl) {
  return AccountClient(
    Dio(BaseOptions(headers: {}, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
