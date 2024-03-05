// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'calendar_bloc.dart';

class CalendarState {
  final List<CalendarEntities> datas; 
  final CalendarStatus status; 
  CalendarState({
    required this.datas,
    required this.status,
  });

  CalendarState copyWith({
    List<CalendarEntities>? datas,
    CalendarStatus? status,
  }) {
    return CalendarState(
      datas: datas ?? this.datas,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'CalendarState(datas: $datas, status: $status)';

  @override
  bool operator ==(covariant CalendarState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.datas, datas) &&
      other.status == status;
  }

  @override
  int get hashCode => datas.hashCode ^ status.hashCode;
}





enum CalendarStatus{ 
  pure, loading, succsess, failure
}