import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/task_models.dart';
import '../entities/task_entity.dart';
import '../repository/task_repo.dart';

class GetTaskUsecase implements UseCase<List<TaskEntity>, NoParams>{
  final TaskRepository _taskRepository;

  GetTaskUsecase({required TaskRepository taskRepository}) : _taskRepository = taskRepository;
  @override
  Future<Either<Failure, List<TaskEntity>>> call(param) async {
    if (param is GetTask) {
      return await _taskRepository.getTask();
    }
    throw UnimplementedError();
  }

}
class GetTask extends NoParams {}

class AddTask extends NoParams {
  final TaskModel taskModel;

  AddTask({required this.taskModel});
}

class AddTaskUsecase implements UseCase<bool , NoParams> {
  final TaskRepository _taskRepository;

  AddTaskUsecase({required TaskRepository taskRepository}) : _taskRepository = taskRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is AddTask) {
      return await _taskRepository.addTask(param.taskModel);
    }
    throw UnimplementedError();
  }}