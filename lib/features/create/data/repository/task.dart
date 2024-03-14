import '../data_source/remote.dart';
import '../models/task.dart';

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
