
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/event_entity.dart';
import '../../domain/repository/event_repository.dart';
import '../data_source/remote_event.dart';
import '../model/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource _eventRemoteDataSource;

  EventRepositoryImpl({required EventRemoteDataSource eventRemoteDataSource})
      : _eventRemoteDataSource = eventRemoteDataSource;
  @override
  Future<Either<Failure, List<EventEntity>>> getEvents() async {
    try {
      final result = await _eventRemoteDataSource.getEvents();
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createEvent(EventModel eventModel) async {
    try {
      final result = await _eventRemoteDataSource.createEvent(eventModel);
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }
}