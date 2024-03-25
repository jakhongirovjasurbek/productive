import 'package:bloc/bloc.dart';
import 'package:productive/core/extensions/data_time_extension.dart';
import 'package:productive/core/injector/injector.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';
import 'package:productive/features/calendar/domain/usecase/usecase.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarTaskBloc extends Bloc<CalendarTaskEvent, CalendarTaskState> {
  CalendarTaskBloc()
      : super(
          CalendarTaskState(
            dailyTask: [],
            selectedMonth: DateTime.now().monthStart,
            datas: [],
            status: CalendarStatus.pure,
          ),
        ) {
    on<CalendarBlocStarted>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: CalendarStatus.loading,
          ),
        );
        final usecase = sl<CalendarUseCase>();
        final either = await usecase.call(
          GetData(),
        );
        either.either(
          (failure) {

            emit(
              state.copyWith(
                status: CalendarStatus.failure,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                status: CalendarStatus.succsess,
                datas: value,
              ),
            );
          },
        );
      },
    );
    on<HeaderEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            selectedMonth: event.value,
          ),
        );
      },
    );
    on<SelectDateEvent>(
      (event, emit) {
        List<CalendarEntities> ls = [];
        for (var i = 0; i < state.datas.length; i++) {
          if (state.datas[i].startTime.day == event.value.day &&
              state.datas[i].startTime.year == event.value.year) {
            ls.add(state.datas[i]);
          }
        }

        emit(
          state.copyWith(selectedDate: event.value, dailyTask: ls),
        );
      },
    );
  }
}
