import 'package:productive/features/create/data/model/expense_model.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/event_model.dart';
import '../entity/event_entity.dart';
import '../repository/event_repository.dart';
import '../repository/expene_repo.dart';

class GetEventUsecase implements UseCase<List<EventEntity>, NoParams>{
  final EventRepository _eventRepository;

  GetEventUsecase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;
  @override
  Future<Either<Failure, List<EventEntity>>> call(param) async {
    if (param is GetEvent) {
      return await _eventRepository.getEvents();
    }
    throw UnimplementedError();
  }

}
class GetEvent extends NoParams {}

class CreateEvent extends NoParams {
  final EventModel eventModel;

  CreateEvent({required this.eventModel});
}

class CreateEventUsecase implements UseCase<bool , NoParams> {
  final EventRepository _eventRepository;

  CreateEventUsecase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is CreateEvent) {
      return await _eventRepository.createEvent(param.eventModel);
    }
    throw UnimplementedError();
  }}