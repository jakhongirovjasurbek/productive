import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';

abstract class CalendarRepository  { 
  Future<Either<Failure, List<CalendarEntities>>> getData();
  
}