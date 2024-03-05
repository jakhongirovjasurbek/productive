import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/calendar/data/data_sourse/data_source.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';
import 'package:productive/features/calendar/domain/repository/repository.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarDataSource _dataSource;
  CalendarRepositoryImpl({required CalendarDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<CalendarEntities>>> getData() async {
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
