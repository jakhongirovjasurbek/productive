import 'package:productive/features/tasks/data/data_source/task_remote.dart';
import 'package:productive/features/tasks/data/models/task_models.dart';


class TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepository({required this.taskRemoteDataSource});
  Future<List<TaskModel>> getTasks()async {

    return taskRemoteDataSource.getTasks();


  }

}