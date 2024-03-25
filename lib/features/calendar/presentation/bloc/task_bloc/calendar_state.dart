part of 'calendar_bloc.dart';

class CalendarTaskState {
  final DateTime selectedMonth; 
  final DateTime? selectedDate;
  final List<CalendarEntities> datas; 
  final CalendarStatus status; 
  final List<CalendarEntities> dailyTask;
  CalendarTaskState({
    required this.selectedMonth,
    this.selectedDate,
    required this.datas,
    required this.status,
    required this.dailyTask,
  });

  CalendarTaskState copyWith({
    DateTime? selectedMonth,
    DateTime? selectedDate,
    List<CalendarEntities>? datas,
    CalendarStatus? status,
    List<CalendarEntities>? dailyTask,
  }) {
    return CalendarTaskState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      datas: datas ?? this.datas,
      status: status ?? this.status,
      dailyTask: dailyTask ?? this.dailyTask,
    );
  }

  @override
  String toString() {
    return 'CalendarTaskState(selectedMonth: $selectedMonth, selectedDate: $selectedDate, datas: $datas, status: $status, dailyTask: $dailyTask)';
  }

  @override
  bool operator ==(covariant CalendarTaskState other) {
    if (identical(this, other)) return true;
  
    return 
      other.selectedMonth == selectedMonth &&
      other.selectedDate == selectedDate &&
      listEquals(other.datas, datas) &&
      other.status == status &&
      listEquals(other.dailyTask, dailyTask);
  }

  @override
  int get hashCode {
    return selectedMonth.hashCode ^
      selectedDate.hashCode ^
      datas.hashCode ^
      status.hashCode ^
      dailyTask.hashCode;
  }
}





enum CalendarStatus{ 
  pure, loading, succsess, failure
}