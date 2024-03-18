import 'package:productive/features/tasks1/data/data_source/remote.dart';
import 'package:productive/features/tasks1/data/models/task_models.dart';


class Task1Repository {
  final Task1RemoteDataSource taskRemoteDataSource;

  Task1Repository({required this.taskRemoteDataSource});
  Future<List<TaskModel>> getTasks()async {

    return taskRemoteDataSource.getTasks();


  }

}