import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'account_app_client.g.dart';

class AccountAppClient extends RepositoryClient<String, Account>
    with BulkRepositoryClientMixin<String, Account> {
  AccountAppClient(Dio api) : super(api, 'account');

  @override
  String toId(Account item) {
    return item.userId;
  }

  @override
  Account fromJson(JsonObject data) {
    return Account.fromJson(data);
  }

  @override
  JsonObject toJson(Account data) {
    return data.toJson();
  }
}

@Riverpod(keepAlive: true)
AccountAppClient accountClient(AccountClientRef ref, String baseUrl) {
  return AccountAppClient(
    Dio(BaseOptions(headers: {}, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
