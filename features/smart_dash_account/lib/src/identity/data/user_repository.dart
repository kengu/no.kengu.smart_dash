import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

part 'user_repository.g.dart';

class UserRepository {
  // TODO: Implement authentication
  User get currentUser => const User(userId: 'u:123');
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}
