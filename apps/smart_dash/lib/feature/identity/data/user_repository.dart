import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';

part 'user_repository.g.dart';

class UserRepository {
  User get currentUser => const User(userId: 'u:123');
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}
