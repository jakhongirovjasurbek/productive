import 'package:productive/features/tasks/data/data_source/data_source.dart';
import 'package:productive/features/tasks/domain/entities/notification_entities.dart';
import 'package:productive/features/tasks/domain/repository/repository.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _dataSource;
  NotificationRepositoryImpl({required NotificationDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<NotificationEntities>>> getData() async {
    try {
      final result = await _dataSource.getData();
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}