import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService(this.ref);
  final Ref ref;

  Future<Optional<User>> authenticate(UserCredentials credentials) async {
    throw UnimplementedError('Implement authentication');
  }
}

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) => AuthService(ref);
