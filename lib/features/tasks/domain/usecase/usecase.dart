import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/tasks/domain/entities/notification_entities.dart';
import 'package:productive/features/tasks/domain/repository/repository.dart';
import '../../../../core/usecase/usecase.dart';

class NotificationUseCase
    implements UseCase<List<NotificationEntities>, NoParams> {
  final NotificationRepository _repositoryImpl;

  NotificationUseCase({
    required NotificationRepository repositoryImpl,
  }) : _repositoryImpl = repositoryImpl;

  @override
  Future<Either<Failure, List<NotificationEntities>>> call(
      NoParams param) async {
    if (param is GetDataNotifi) {
      return await _repositoryImpl.getData();
    } else {
      print("---------------------------------------UnimplementedError-------------------------------");
      throw UnimplementedError();
    }
  }
}

class GetDataNotifi extends NoParams {}
