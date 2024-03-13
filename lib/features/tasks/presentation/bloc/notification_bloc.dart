import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive/features/tasks/domain/usecase/usecase.dart';

import '../../../../core/injector/injector.dart';
import '../../domain/entities/notification_entities.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationInitial> {
  NotificationBloc()
      : super(NotificationInitial(data: [], status: NotificationStatus.pure)) {
    on<GetNotifications>((event, emit) async {
      emit(
        state.copyWith(
          status: NotificationStatus.loading,
        ),
      );
      print("Loading success");
      final usecase = sl<NotificationUseCase>();
      final either = await usecase.call(
        GetDataNotifi(),
      );
      print("Get Success Notifications");
      print("GetData success");
      either.either((failure) {
        print("----------------------------------${failure}----------------------------------------");
        emit(
          state.copyWith(
            status: NotificationStatus.failure,
          ),
        );
      }, (value) {
        int len = value.length;
        print("Value get success");
        emit(
          state.copyWith(
            status: len == 0
                ? NotificationStatus.empty
                : NotificationStatus.success,
            data: value,
          ),
        );
      });
    });
  }
}
