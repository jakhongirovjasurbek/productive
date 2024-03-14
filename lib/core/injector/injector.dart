import 'package:get_it/get_it.dart';
import 'package:productive/features/calendar/data/data_sourse/data_source.dart';
import 'package:productive/features/calendar/data/repository/repository.dart';
import 'package:productive/features/calendar/domain/repository/repository.dart';
import 'package:productive/features/calendar/domain/usecase/usecase.dart';
import 'package:productive/features/tasks/data/data_source/data_source.dart';
import 'package:productive/features/tasks/data/repository/repository.dart';
import 'package:productive/features/tasks/domain/usecase/usecase.dart';

import '../../features/tasks/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> getItInjector() async {
  calendarUseCase();
  sl.registerSingletonAsync(
          () async => await SharedPreferences.getInstance());
  notificationUseCase();
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

notificationUseCase() {
  sl
    ..registerFactory(
      () => NotificationUseCase(
        repositoryImpl: sl(),
      ),
    )
    ..registerLazySingleton<CalendarRepositoryImpl>(
      () => CalendarRepositoryImpl(
        dataSource: sl(),
      ),
    )..registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(dataSource: sl()))
    ..registerLazySingleton(() => NotificationDataSource());
}
