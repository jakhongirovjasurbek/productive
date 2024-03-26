import 'package:productive/features/tasks/data/data_source/task_remote.dart';
import 'package:productive/features/tasks/data/models/task_models.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repository/task_repo.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;

  TaskRepositoryImpl({required TaskRemoteDataSource taskRemoteDataSource})
      : _taskRemoteDataSource = taskRemoteDataSource;
  @override
  Future<Either<Failure, List<TaskEntity>>> getTask() async {
    try {
      final result = await _taskRemoteDataSource.getTask();
      return Right(result);
    } catch(error) {
      print(" =========== $error =========");
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addTask(TaskModel taskModel) async {
    try {
      final result = await _taskRemoteDataSource.addTask(taskModel);
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }
}