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

class SaveButtonPressed extends CreateEventEvent {}
