import 'package:task_manager/domain/entities/task_entity.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository taskRepository;
  AddTaskUseCase(this.taskRepository);

  Future<void> call(TaskEntity task) async{
   return await taskRepository.addTask(task);
  }
}