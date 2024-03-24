import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../data/model/event_model.dart';
import '../entity/event_entity.dart';

abstract class EventRepository {
  Future<Either<Failure, List<EventEntity>>> getEvents();
  Future<Either<Failure,bool>> createEvent(EventModel eventModel);
}