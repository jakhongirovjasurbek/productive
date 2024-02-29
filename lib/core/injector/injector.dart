import 'package:get_it/get_it.dart';
import 'package:productive/features/calendar/data/data_sourse/data_source.dart';
import 'package:productive/features/calendar/data/repository/repository.dart';
import 'package:productive/features/calendar/domain/repository/repository.dart';
import 'package:productive/features/calendar/domain/usecase/usecase.dart';

final sl = GetIt.instance;

Future<void> getItInjector() async {
  calendarUseCase();
}

calendarUseCase() {
  sl
    ..registerFactory(() => CalendarUseCase(
          repositoryImpl: sl(),
        ))
    ..registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(
          dataSource: sl(),
        ))
    ..registerLazySingleton(
      () => CalendarDataSource(),
    );
}
