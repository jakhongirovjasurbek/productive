import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/features/tasks/data/models/task_models.dart';
import 'package:productive/features/tasks/data/models/status.dart';
import 'package:productive/features/tasks/domain/entities/task_entity.dart';

import '../../../../assets/colors.dart';
import '../../data/data_source/task_remote.dart';
import '../../data/repository/task_repo_impl.dart';
import '../../domain/usecase/task_usecases.dart';


part 'task_state.dart';
part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() :
        super(TaskState(
            searchedTask: [],
            iconColor: "blueColor",
            isSearching: false,
            selectIcon: "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Ftasks.svg?alt=media&token=cdc71083-9c06-4c45-8b41-8c010044bb84",
            selectIconColor: Colors.blue,
            status: LoadingStatus.pure,
            taskList: [],
            upcomingList: [],
            position: GeoPoint(0, 0),
            startDate: Timestamp(-21600, 0,),
            endDate: Timestamp(-21600, 1,))) {
    on<LoadingTask>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase = GetTaskUsecase(
          taskRepository: TaskRepositoryImpl(
              taskRemoteDataSource: TaskRemoteDataSource()));
      final either = await usecase.call(GetTask());
      either.either((failure) {
        print(" ---------- $failure ----------");
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess,
            taskList: value,
            upcomingList: value.where((element) => !element.isChecked).toList(),
        ));
      });
    });
    on<CheckedTask>((event, emit) {
      var newList = <TaskEntity>[];
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
    on<CreateNewTaskButtonPressed>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final newTask = AddTaskUsecase(taskRepository: TaskRepositoryImpl(taskRemoteDataSource: TaskRemoteDataSource()));
      final either = await newTask.call(AddTask(
          taskModel: TaskModel(
              title: event.title,
              icon: event.icon,
              note: event.note,
              priority: event.priority,
              iconColor: event.iconColor,
              startDate: event.startDate,
              dueDate: event.dueDate,
              isChecked: event.isChecked,
            position: event.position,
          )));

      either.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure(String as String);
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess));
        event.onSuccess();
      });

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
    on<SelectIconTask>((event, emit){
      switch(event.index) {
        case 0:
          emit(
            state.copyWith(iconColor: "inkColor",
            selectIcon: "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fbag.svg?alt=media&token=42d0cae5-7cc7-476c-9b98-0469071ff65b"),
          );
        case 1:
          emit(
            state.copyWith(iconColor: "pinkColor",
            selectIcon: "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fstudy.svg?alt=media&token=bd2845b7-2354-4526-86fa-59c35def3761"),
          );
        case 2:
          emit(
            state.copyWith(iconColor: "orangeColor",
               selectIcon:  "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fsport.svg?alt=media&token=bb61931f-440f-4aa2-b830-75b0a4ea1134"),
          );
        case 3:
          emit(
            state.copyWith(iconColor: "greenColor",
            selectIcon: "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Fmeet.svg?alt=media&token=21dd0713-8db0-4e36-87ca-4db87f2d6361"),
          );
        default:
          emit(
            state.copyWith(iconColor: "blueColor",
            selectIcon: "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/task_icons%2Ftasks.svg?alt=media&token=cdc71083-9c06-4c45-8b41-8c010044bb84"),
          );
      }
    });
    on<SelectPriorityColor>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(priorityColor: AppColors.redPriority),
          );
        case 1:
          emit(
            state.copyWith(priorityColor: AppColors.yellowPriority),
          );
        case 2:
          emit(
            state.copyWith(priorityColor: AppColors.greenPriority),
          );
        default:
          emit(
            state.copyWith(priorityColor: Colors.transparent),
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
    on<AddLocation>((event,emit){
      emit(state.copyWith(position: GeoPoint(event.latitute, event.lontitute)));
    });
  }
}
