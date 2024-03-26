import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../data/models/task_models.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getTask();
  Future<Either<Failure,bool>> addTask(TaskModel taskModel);
}