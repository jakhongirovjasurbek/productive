part of 'event_bloc.dart';

class CreateEventState extends Equatable {
  final bool isAllDay;
  final String repeatTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final int selectedIconIndex;

  CreateEventState({
    required this.isAllDay,
    required this.repeatTime,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.selectedIconIndex,
  });

  factory CreateEventState.initial() {
    return CreateEventState(
      isAllDay: false,
      repeatTime: 'Once',
      startDate: null,
      endDate: null,
      startTime: null,
      endTime: null,
      selectedIconIndex: -1,
    );
  }

  CreateEventState copyWith({
    bool? isAllDay,
    String? repeatTime,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? startTime,
    DateTime? endTime,
    int? selectedIconIndex,
  }) {
    return CreateEventState(
      isAllDay: isAllDay ?? this.isAllDay,
      repeatTime: repeatTime ?? this.repeatTime,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      selectedIconIndex: selectedIconIndex ?? this.selectedIconIndex,
    );
  }

  @override
  List<Object?> get props => [
    isAllDay,
    repeatTime,
    startDate,
    endDate,
    startTime,
    endTime,
    selectedIconIndex,
  ];
}
