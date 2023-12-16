import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';
import 'package:smart_dash/feature/identity/domain/user_credentials.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService(this.ref);
  final Ref ref;

  Future<Optional<User>> authenticate(UserCredentials credentials) async {
    throw UnimplementedError('Implement authentication');
  }
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) => AuthService(ref);
