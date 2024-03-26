
part of 'task_bloc.dart';

class TaskState {
  final LoadingStatus status;
  final List<TaskEntity> taskList;
  final List<TaskEntity> upcomingList;
  final List<TaskEntity> searchedTask;
  final Timestamp startDate;
  final Timestamp endDate;
  final Color selectIconColor;
  final String selectIcon;
  final String iconColor;
  final Color? priorityColor;
  final bool isSearching;
  final GeoPoint position;
  TaskState({
    required this.position,
    required this.status,
    required this.taskList,
    required this.upcomingList,
    required this.searchedTask,
    required this.startDate,
    required this.endDate,
    required this.selectIconColor,
    required this.selectIcon,
    this.priorityColor,
    required this.iconColor,
    required this.isSearching,
  });


  TaskState copyWith({
    LoadingStatus? status,
    List<TaskEntity>? taskList,
    List<TaskEntity>? upcomingList,
    List<TaskEntity>? searchedTask,
    Timestamp? startDate,
    Timestamp? endDate,
    Color? selectIconColor,
    String? selectIcon,
    String? iconColor,
    Color? priorityColor,
    bool? isSearching,
    GeoPoint? position,
  }) {
    return TaskState(
      status: status ?? this.status,
      position: position ?? this.position,
      taskList: taskList ?? this.taskList,
      upcomingList: upcomingList ?? this.upcomingList,
      searchedTask: searchedTask ?? this.searchedTask,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectIconColor: selectIconColor ?? this.selectIconColor,
      selectIcon: selectIcon ?? this.selectIcon,
      priorityColor: priorityColor ?? this.priorityColor,
      isSearching: isSearching ?? this.isSearching,
      iconColor:  iconColor ?? this.iconColor,
    );
  }

  @override
  String toString() {
    return 'TaskState(status: $status, taskList: $taskList, upcomingList: $upcomingList, searchedTask: $searchedTask, startDate: $startDate, endDate: $endDate, selectIconColor: $selectIconColor, selectIcon: $selectIcon, priorityColor: $priorityColor, isSearching: $isSearching)';
  }

  @override
  bool operator ==(covariant TaskState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.taskList, taskList) &&
          listEquals(other.upcomingList, upcomingList) &&
          listEquals(other.searchedTask, searchedTask) &&
          other.startDate == startDate &&
          other.endDate == endDate &&
          other.selectIconColor == selectIconColor &&
          other.selectIcon == selectIcon &&
          other.priorityColor == priorityColor &&
          other.isSearching == isSearching &&
          other.iconColor == iconColor &&
    other.position == position;
  }

  @override
  int get hashCode {
    return status.hashCode ^
    taskList.hashCode ^
    upcomingList.hashCode ^
    searchedTask.hashCode ^
    startDate.hashCode ^
    endDate.hashCode ^
    selectIconColor.hashCode ^
    selectIcon.hashCode ^
    priorityColor.hashCode ^
    iconColor.hashCode ^
    position.hashCode ^
    isSearching.hashCode;
  }
}


