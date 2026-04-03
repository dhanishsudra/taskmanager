import 'package:task_manager/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository taskRepository;
  DeleteTaskUseCase(this.taskRepository);

  Future<void> call(String taskId) async{
   return await taskRepository.deleteTask(taskId);
  }
}