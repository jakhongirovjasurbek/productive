// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calendar_bloc.dart';

 class CalendarTaskEvent {}


class CalendarBlocStarted extends CalendarTaskEvent {
  
}


class HeaderEvent extends CalendarTaskEvent {
  final DateTime value;
  HeaderEvent({
    required this.value,
  });
  
}
class SelectDateEvent extends CalendarTaskEvent {
  final DateTime value;
  SelectDateEvent({
    required this.value,
  });
  
}
