import 'package:task_manager/domain/models/user_entity.dart';

abstract class AuthRepository {

  Future <UserEntity> signInWithEmail(String email, String password);
  Future<void> logout();
  Stream<UserEntity?> get authStateChanges;

}