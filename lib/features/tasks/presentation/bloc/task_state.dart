// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState {
  final LoadingStatus status;
  final List<TaskModel> tasklist;

  final DateTime startDate;
  final DateTime endDate;
  final Color selectIconcolor;
  final String selectIcon;
  final Color? priorityColor;

  TaskState({
    required this.status,
    required this.tasklist,
    required this.startDate,
    required this.endDate,
    required this.selectIconcolor,
    required this.selectIcon,
    this.priorityColor,
  });

  TaskState copyWith({
    LoadingStatus? status,
    List<TaskModel>? tasklist,
    DateTime? startDate,
    DateTime? endDate,
    Color? selectIconcolor,
    String? selectIcon,
    Color? priorityColor,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasklist: tasklist ?? this.tasklist,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectIconcolor: selectIconcolor ?? this.selectIconcolor,
      selectIcon: selectIcon ?? this.selectIcon,
      priorityColor: priorityColor ?? this.priorityColor,
    );
  }

  @override
  String toString() {
    return 'TaskState(status: $status, tasklist: $tasklist, startDate: $startDate, endDate: $endDate, selectIconcolor: $selectIconcolor, selectIcon: $selectIcon, priorityColor: $priorityColor, )';
  }

  @override
  bool operator ==(covariant TaskState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.tasklist, tasklist) &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.selectIconcolor == selectIconcolor &&
        other.selectIcon == selectIcon &&
        other.priorityColor == priorityColor;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        tasklist.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        selectIconcolor.hashCode ^
        selectIcon.hashCode ^
        priorityColor.hashCode;
  }
}
