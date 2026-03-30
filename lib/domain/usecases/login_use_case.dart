import 'package:task_manager/domain/models/user_entity.dart';
import 'package:task_manager/domain/repositories/auth_repository.dart';

class LoginUseCase {
   final AuthRepository repository;
   LoginUseCase(this.repository);

   Future<UserEntity> call(String email, String password)async{
     return await repository.signInWithEmail(email, password);
   }
}
