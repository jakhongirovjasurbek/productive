import 'dart:core';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_state.dart';
part 'event_event.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  CreateEventBloc() : super(CreateEventState.initial()) {
    on<AllDayButtonPressed>(_handleAllDayButtonPressed);
    on<RepeatTimeChanged>(_handleRepeatTimeChanged);
    on<StartDateSelected>(_handleStartDateSelected);
    on<EndDateSelected>(_handleEndDateSelected);
    on<StartTimeSelected>(_handleStartTimeSelected);
    on<EndTimeSelected>(_handleEndTimeSelected);
    on<TopicIconPressed>(_handleTopicIconPressed);
    on<SaveButtonPressed>(_handleSaveButtonPressed);
  }

  void _handleAllDayButtonPressed(
      AllDayButtonPressed event, Emitter<CreateEventState> emit) {
    final newIsAllDay = !state.isAllDay;
    emit(state.copyWith(isAllDay: newIsAllDay));
  }

  void _handleRepeatTimeChanged(
      RepeatTimeChanged event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(repeatTime: event.repeatTime));
  }

  void _handleStartDateSelected(
      StartDateSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(startDate: event.selectedDate));
  }

  void _handleEndDateSelected(
      EndDateSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(endDate: event.selectedDate));
  }

  void _handleStartTimeSelected(
      StartTimeSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(startTime: event.selectedTime));
  }

  void _handleEndTimeSelected(
      EndTimeSelected event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(endTime: event.selectedTime));
  }

  void _handleTopicIconPressed(
      TopicIconPressed event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(selectedIconIndex: event.iconIndex));
  }

  void _handleSaveButtonPressed(
      SaveButtonPressed event, Emitter<CreateEventState> emit) {
    final isAllDay = state.isAllDay;
    final repeatTime = state.repeatTime;
    final startDate = state.startDate;
    final endDate = state.endDate;
    final startTime = state.startTime;
    final endTime = state.endTime;
    final selectedIconIndex = state.selectedIconIndex;

    // Perform save operation
    // emit(state.copyWith(...));
  }
}
