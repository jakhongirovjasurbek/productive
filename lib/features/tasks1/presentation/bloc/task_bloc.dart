import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/tasks1/data/repository/task.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/features/tasks1/data/models/task_models.dart';
import 'package:productive/features/tasks1/data/models/status.dart';
import 'package:productive/features/tasks1/data/models/priority.dart';


part 'task_state.dart';
part 'task_event.dart';

class Task1Bloc extends Bloc<TaskEvent, TaskState> {
  final Task1Repository _response;

  Task1Bloc({required Task1Repository response})
      : _response = response,
        super(TaskState(
            searchedTask: [],
            isSearching: false,
            selectIcon: AppIcons.tasks,
            selectIconColor: Colors.blue,
            status: LoadingStatus.pure,
            taskList: [],
            upcomingList: [],
            startDate: DateTime(2000, 1, 1, 10),
            endDate: DateTime(2000, 1, 1, 10))) {
    on<LoadingTask>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<TaskModel> ls = (await _response.getTasks()).cast<TaskModel>();

        emit(
          state.copyWith(
            taskList: ls,
            status: LoadingStatus.loadedWithSuccess,
            upcomingList: ls.where((element) => !element.isChecked).toList(),
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });
    on<CheckedTask>((event, emit) {
      var newList = <TaskModel>[];
      for (var i = 0; i < state.taskList.length; i++) {
        if (state.taskList[i].id == event.index) {
          newList.add(
            state.taskList[i].copyWith(isChecked: !state.taskList[i].isChecked),
          );
        } else {
          newList.add(state.taskList[i]);
        }
      }
      emit(state.copyWith(
        taskList: newList,
        upcomingList: newList.where((element) => !element.isChecked).toList(),
      ));
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
                selectIcon: AppIcons.bag1, selectIconColor: Colors.blue),
          );
        case 1:
          emit(
            state.copyWith(
                selectIcon: AppIcons.studyTask, selectIconColor: Colors.red),
          );
        default:
          emit(
            state.copyWith(
                selectIcon: AppIcons.sportTask, selectIconColor: Colors.red),
          );
      }
    });
    on<SelectPriorityColor>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(priorityColor: Colors.red),
          );
        case 1:
          emit(
            state.copyWith(priorityColor: Colors.yellow),
          );

        default:
          emit(
            state.copyWith(priorityColor: Colors.green),
          );
      }
    });
    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.taskList
            .where((element) => element.title.contains(event.query))
            .toList();
        emit(state.copyWith(searchedTask: newList, isSearching: true));
      }
    });
  }
}
