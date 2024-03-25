import 'dart:core';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/create/domain/entity/event_entity.dart';

import '../../../../core/status/status.dart';
import '../../data/data_source/remote_event.dart';
import '../../data/data_source/remote_expense.dart';
import '../../data/model/event_model.dart';
import '../../data/repository/event_repository.dart';
import '../../domain/repository/event_repository.dart';
import '../../domain/usecase/event_usecase.dart';

part 'event_state.dart';
part 'event_event.dart';

// Import statements...

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final EventRepository eventRepository;

  CreateEventBloc({required this.eventRepository})
      : super(CreateEventState.initial()) {
    on<AllDayButtonPressed>(_handleAllDayButtonPressed);
    on<RepeatTimeChanged>(_handleRepeatTimeChanged);
    on<StartDateSelected>(_handleStartDateSelected);
    on<EndDateSelected>(_handleEndDateSelected);
    on<StartTimeSelected>(_handleStartTimeSelected);
    on<EndTimeSelected>(_handleEndTimeSelected);
    on<TopicIconPressed>(_handleTopicIconPressed);
    on<LoadingEvent>(_handleLoadingEvent);
    on<SaveButtonPressed>(_handleSaveButtonPressed);
  }

  // Event handler methods

  void _handleAllDayButtonPressed(AllDayButtonPressed event, Emitter<CreateEventState> emit) {
    final newIsAllDay = !state.isAllDay;
    emit(state.copyWith(isAllDay: newIsAllDay));
  }

  void _handleRepeatTimeChanged(RepeatTimeChanged event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(repeatTime: event.repeatTime));
  }

  void _handleStartDateSelected(StartDateSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(startDate: event.selectedDate));
  }

  void _handleEndDateSelected(EndDateSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(endDate: event.selectedDate));
  }

  void _handleStartTimeSelected(StartTimeSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(startTime: event.selectedTime));
  }

  void _handleEndTimeSelected(EndTimeSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(endTime: event.selectedTime));
  }

  void _handleTopicIconPressed(TopicIconPressed event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(selectedIconIndex: event.iconIndex));
  }

  void _handleLoadingEvent(LoadingEvent event, Emitter<CreateEventState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    final usecase = GetEventUsecase(eventRepository: eventRepository);
    final eventsList = await usecase.call(GetEvent());
    if (eventsList != null) {
      emit(state.copyWith(
        status: LoadingStatus.loadedWithSuccess,
        eventsList: eventsList,
      ));
    } else {
      emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
    }
  }

  void _handleSaveButtonPressed(SaveButtonPressed event, Emitter<CreateEventState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    final newEvent = CreateEventUsecase(eventRepository: eventRepository);
    final startTimeStamp = Timestamp.fromDate(event.startTime!);
    final startDateStamp = Timestamp.fromDate(event.startDate!);
    final endTimeStamp = Timestamp.fromDate(event.endTime!);
    final endDateStamp = Timestamp.fromDate(event.endDate!);
    final success = await newEvent.call(CreateEvent(
      eventModel: EventModel(
        isAllDay: event.isAllDay,
        repeatTime: event.repeatTime,
        selectedIconIndex: event.selectedIconIndex,
        eventTitle: event.eventTitle,
        startTime: startTimeStamp,
        startDate: startDateStamp,
        endDate: endTimeStamp,
        endTime: endDateStamp,
        addNote: event.addNote,
        id: event.id,
      ),
    ));

    if (success == true) {
      emit(state.copyWith(status: LoadingStatus.loadedWithSuccess));
    } else {
      emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
    }
  }
}
