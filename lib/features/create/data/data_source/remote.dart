import 'package:productive/core/exception/exception.dart';

import '../mock_data.dart';
import '../models/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();

  Future<bool> createTask({
    required TaskModel task,
  });

  factory TaskRemoteDataSource() => _TaskRemoteDataSourceImpl();
}

class _TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final tasks = await dataTask['tasks'];

      final response = (tasks as List).map(
        (e) {
          return TaskModel.fromJson(e);
        },
      ).toList();

      return response;
    } catch (error) {
      print(error);
      throw ServerException(
          errorMessage: 'Xatolik yuz berdi!', errorCode: "500");
    }
  }

  @override
  Future<bool> createTask({
    required TaskModel task,
  }) async {
    try {
      List<dynamic> data = await dataTask["tasks"];

      data.add(task.toJson());

      return true;
    } catch (error) {
      print(error);
      throw ServerException(
          errorMessage: 'Xatolik yuz berdi!', errorCode: "500");
    }
  }
}
