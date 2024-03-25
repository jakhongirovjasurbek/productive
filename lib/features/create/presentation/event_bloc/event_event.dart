part of 'event_bloc.dart';

abstract class CreateEventEvent extends Equatable {
  const CreateEventEvent();

  @override
  List<Object> get props => [];
}

class AllDayButtonPressed extends CreateEventEvent {}

class RepeatTimeChanged extends CreateEventEvent {
  final String repeatTime;

  const RepeatTimeChanged(this.repeatTime);

  @override
  List<Object> get props => [repeatTime];
}

class StartDateSelected extends CreateEventEvent {
  final DateTime selectedDate;

  const StartDateSelected(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class EndDateSelected extends CreateEventEvent {
  final DateTime selectedDate;

  const EndDateSelected(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class StartTimeSelected extends CreateEventEvent {
  final DateTime selectedTime;

  const StartTimeSelected(this.selectedTime);

  @override
  List<Object> get props => [selectedTime];
}

class EndTimeSelected extends CreateEventEvent {
  final DateTime selectedTime;

  const EndTimeSelected(this.selectedTime);

  @override
  List<Object> get props => [selectedTime];
}

class TopicIconPressed extends CreateEventEvent {
  final int iconIndex;

  const TopicIconPressed(this.iconIndex);

  @override
  List<Object> get props => [iconIndex];
}

class SaveButtonPressed extends CreateEventEvent {
  final String id;
  final bool isAllDay;
  final String repeatTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final int selectedIconIndex;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  final String eventTitle;
  final String addNote;

  SaveButtonPressed( {
    required this.id,
    required this.isAllDay,
    required this.repeatTime,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.selectedIconIndex,
    required this.onSuccess,
    required this.onFailure,
    required this.addNote,
    required this.eventTitle
});
  @override
  List<Object> get props => [id,isAllDay,repeatTime,startDate!,startTime!,
    endDate!,endTime!,selectedIconIndex,onFailure,onSuccess];


}
class LoadingEvent extends CreateEventEvent {
  @override
  List<Object> get props => [];
}




