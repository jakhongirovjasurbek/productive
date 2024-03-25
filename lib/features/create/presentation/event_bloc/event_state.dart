part of 'event_bloc.dart';

class CreateEventState extends Equatable {
  final LoadingStatus status;
  final String id;
  final bool isAllDay;
  final String repeatTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final int selectedIconIndex;
  final  List<EventEntity> eventsList;

  CreateEventState({
    required this.status,
    required this.eventsList,
    required this.id,
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
      status : LoadingStatus.pure,
      eventsList: [],
      id: '',
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
    String? id,
    bool? isAllDay,
    String? repeatTime,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? startTime,
    DateTime? endTime,
    int? selectedIconIndex,
     LoadingStatus? status,
    Either<Failure, List<EventEntity>>? eventsList,

  }) {
    return CreateEventState(
      status : status ?? this.status,
      id: id ?? this.id,
      isAllDay: isAllDay ?? this.isAllDay,
      repeatTime: repeatTime ?? this.repeatTime,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      selectedIconIndex: selectedIconIndex ?? this.selectedIconIndex, eventsList: [],
    );
  }

  @override
  List<Object?> get props => [
    eventsList,
    id,
    isAllDay,
    repeatTime,
    startDate,
    endDate,
    startTime,
    endTime,
    selectedIconIndex,
  ];
}
