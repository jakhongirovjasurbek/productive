import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/extensions/tasks_extension.dart';

import '../../../../core/exception/exception.dart';
import '../../domain/entities/task_entity.dart';
import '../models/task_models.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskEntity>> getTask();
  Future<bool> addTask(TaskModel taskModel);

  factory TaskRemoteDataSource() => _ToDoRemoteDataSource();
}

class _ToDoRemoteDataSource implements TaskRemoteDataSource{
  @override
  Future<List<TaskEntity>> getTask() async {
    final firebase = FirebaseFirestore.instance;
    final collection = await firebase.collection('tasks').get();
    final task = collection.docs.map((e) => TaskModel.fromJson(e.data(),e.id)).toList();
    if (task.isNotEmpty) {
      return task.map((e) => e.toTaskEntities).toList();
    }
    else {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> addTask(TaskModel taskModel) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('tasks').add(
        taskModel.toJson(),
      );
      return true;
    } catch(e) {
      throw ServerException(
          errorMessage: "Cannot add task",
          errorCode: '666'
      );
    }
  }
}