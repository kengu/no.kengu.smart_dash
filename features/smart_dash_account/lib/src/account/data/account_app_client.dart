import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'account_app_client.g.dart';

class AccountAppClient extends RepositoryClient<String, Account> {
  AccountAppClient(super.api) : super(suffix: 'account');

  @override
  String toId(Account item) {
    return item.userId;
  }

  @override
  Account fromData(Account data) {
    return data;
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
AccountAppClient accountClient(Ref ref, String baseUrl) {
  return AccountAppClient(
    Dio(BaseOptions(headers: {}, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
