import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/exception/exception.dart';
import 'package:productive/features/tasks1/data/models/task_models.dart';

abstract class Task1RemoteDataSource {
  Future<List<TaskModel>> getTasks();

  factory Task1RemoteDataSource() => _TaskRemoteDataSourceImpl();
}

class _TaskRemoteDataSourceImpl implements Task1RemoteDataSource {
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
