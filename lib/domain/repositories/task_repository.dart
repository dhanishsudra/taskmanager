import 'package:task_manager/domain/entities/task_entity.dart';

abstract class TaskRepository {

  /// Get all tasks of current user Live update
  Stream<List<TaskEntity>> getTasks();

  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String taskId);
  Future<void> toggleTaskCompletion(String taskId, bool isCompleted);
}