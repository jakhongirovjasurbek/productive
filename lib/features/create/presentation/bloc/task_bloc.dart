import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import 'package:productive/core/extensions/extensions.dart';

import 'package:flutter/foundation.dart';

import '../../data/models/priority.dart';
import '../../data/models/status.dart';
import '../../data/models/task.dart';
import '../../data/repository/task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _response;

  TaskBloc({required TaskRepository response})
      : _response = response,
        super(
          TaskState(
            selectIcon: "assets/icons/create_task/tasks.svg",
            selectIconcolor: const Color(0xFF4B7FD6),
            status: LoadingStatus.pure,
            tasklist: [],
            startDate: DateTime(2000, 1, 1, 10),
            endDate: DateTime(2000, 1, 1, 10),
          ),
        ) {
    on<LoadingTask>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<TaskModel> ls = await _response.getTasks();

        emit(
          state.copyWith(
            tasklist: ls,
            status: LoadingStatus.loadedWithSuccess,
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });

    on<CreateStartDataTime>((event, emit) {
      emit(state.copyWith(startDate: event.time));
    });
    on<CreateEndDataTime>((event, emit) {
      emit(state.copyWith(endDate: event.time));
    });
    on<SelectIconButtonPressed>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(
                selectIcon: event.context.icons.bag,
                selectIconcolor: event.context.colors.workColor),
          );
        case 1:
          emit(
            state.copyWith(
                selectIcon: event.context.icons.study,
                selectIconcolor: event.context.colors.studyColor),
          );
        default:
          emit(
            state.copyWith(
              selectIcon: event.context.icons.sport,
              selectIconcolor: event.context.colors.expensesFood,
            ),
          );
      }
    });
    on<SelectPriorityColor>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(
                priorityColor: event.context.colors.notificationsClear),
          );
        case 1:
          emit(
            state.copyWith(
                priorityColor: event.context.colors.expensesTransport),
          );

        default:
          emit(
            state.copyWith(priorityColor: event.context.colors.expensesGreen),
          );
      }
    });
    on<CreateNewTaskButtonPressed>((event, emit) async {
      final isGood = await response.createTask(
          task: TaskModel(
        title: event.title,
        icon: event.icon,
        priority: event.priority.toString(),
        startDate: event.startDate,
        dueDate: event.dueDate,
      ));

      if (isGood) {
        add(LoadingTask());
      }
    });
  }
}
