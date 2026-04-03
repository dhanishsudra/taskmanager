
import 'package:task_manager/domain/entities/task_entity.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class GetTasksUseCase {
  GetTasksUseCase(this.taskRepository);
  final TaskRepository taskRepository;

  Stream<List<TaskEntity>> call(){
      return taskRepository.getTasks();
  }
}