import '../models/task.dart';
import 'package:productive/features/create/data/data_source/remote.dart';
class TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepository({required this.taskRemoteDataSource});

  Future<List<TaskModel>> getTasks() async {
    return taskRemoteDataSource.getTasks();
  }

  Future<bool> createTask({required TaskModel task}) async {
    return taskRemoteDataSource.createTask(task: task);
  }
}
