import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/exception/exception.dart';
import 'package:productive/features/tasks/data/models/task_models.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();

  factory TaskRemoteDataSource() => _TaskRemoteDataSourceImpl();
}

class _TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('tasks').get();
      final tasks = collection.docs
          .map((item) => TaskModel.fromJson(item.data(), item.id))
          .toList();
      return tasks;
    } catch (error) {
      print(error);
      throw ServerException(
          errorMessage: 'Xatolik yuz berdi!', errorCode: '500');
    }
  }
}
