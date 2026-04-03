import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
   TaskModel({
    required super.id,
    required super.title,
    required super.priority,
    required super.isCompleted,
    required super.userId,
    required super.createdAt,
             super.description,
             super.dueDate,
  });


  factory TaskModel.fromFirestore(Map<String, dynamic> data, String id){
      return TaskModel(
          id: id,
          title: data['title'],
          description: data['description'],
          dueDate: (data['dueDate'] as Timestamp?)?.toDate(),
          priority: data['priority'] ?? 'medium',
          isCompleted: data['isCompleted'],
          userId: data['userId'],
          createdAt: data['createdAt'] ?? DateTime.now(),
      );
   }

   Map<String, dynamic> toFirestore(){
    return {
      'title': title,
      'priority': priority,
      'isCompleted': isCompleted,
      'userId': userId,
      'description': description,
      'dueDate': dueDate != null ? Timestamp.fromDate(dueDate!) : null,
      'createdAt': Timestamp.fromDate(createdAt),
    };
   }
}