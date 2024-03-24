import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final bool isAllDay;
  final String repeatTime;
  final Timestamp startDate;
  final Timestamp endDate;
  final Timestamp startTime;
  final Timestamp endTime;
  final int selectedIconIndex;

  EventEntity({
    required this.isAllDay,
    required this.repeatTime,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.selectedIconIndex,
  });

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