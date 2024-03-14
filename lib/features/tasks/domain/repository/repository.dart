import 'package:productive/features/tasks/domain/entities/notification_entities.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class NotificationRepository{
  Future<Either<Failure, List<NotificationEntities>>> getData();
}