
import 'package:task_manager/domain/repositories/auth_repository.dart';

class LogoutUseCase {
 final AuthRepository repository;
 LogoutUseCase(this.repository);

 Future<void> call()async{
   await repository.logout();
 }
}