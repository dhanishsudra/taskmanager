import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/domain/entities/task_entity.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository{

  final FirebaseFirestore fireStore;
  final String userId;
  TaskRepositoryImpl(this.fireStore, this.userId);

  /// Helper to get collection reference
  CollectionReference get taskCollection => fireStore.collection('users').doc(userId).collection('tasks');

  @override
  Stream<List<TaskEntity>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<void> addTask(TaskEntity task) {
   // add item
    final model = TaskModel(
        id: task.id,
        title: task.title,
        priority: task.priority,
        isCompleted: task.isCompleted,
        userId: userId,
        createdAt: task.createdAt,
    );
    return taskCollection.add(model.toFirestore());
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await taskCollection.doc(task.id).update(task as Map<Object, Object?>);
  }

  @override
  Future<void> deleteTask(String taskId)async {
  await taskCollection.doc(taskId).delete();
  }


  @override
  Future<void> toggleTaskCompletion(String taskId, bool isCompleted)async {
  await taskCollection.doc(taskId).update({'isCompleted' : isCompleted});
  }

}