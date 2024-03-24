import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String eventTitle;
  final String repeatTime;
  final int selectedIconIndex;
  final String? addNote;
  final Timestamp startDate;
  final Timestamp endDate;
  final Timestamp startTime;
  final Timestamp endTime;
  final bool isAllDay;

  EventModel({
    required this.id,
    required this.eventTitle,
    required this.repeatTime,
    required this.selectedIconIndex,
    this.addNote,
    required this.startDate,
    required this.endDate,
    required this.isAllDay,
    required this.startTime,
    required this.endTime
  });

  factory EventModel.fromJson(Map<String, dynamic> json, String id) {
    return EventModel(
      id: id,
      eventTitle: json['eventTitle'],
      addNote: json['addNote'],
      repeatTime: json['repeatTime'],
      selectedIconIndex: json['selectedIconIndex'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      isAllDay: json['isAllDay'],
      startTime: json['startTime'],
      endTime: json['endTime'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventTitle': eventTitle,
      'addNote': addNote,
      'repeatTime': repeatTime,
      'selectedIconIndex': selectedIconIndex,
      'startDate': startDate,
      'endDate': endDate,
      'startTime':startTime,
      'endTime': endTime,
      'isAllDay': isAllDay,
    };
  }

  EventModel copyWith({
    String? id,
    String? eventTitle,
    String? repeatTime,
    int? selectedIconIndex,
    String? addNote,
    Timestamp? startDate,
    Timestamp? endDate,
    Timestamp? startTime,
    Timestamp? endTime,
    bool? isAllDay,
  }) {
    return EventModel(
      id: id ?? this.id,
      eventTitle: eventTitle ?? this.eventTitle,
      repeatTime: repeatTime ?? this.repeatTime,
      selectedIconIndex: selectedIconIndex ?? this.selectedIconIndex,
      addNote: addNote ?? this.addNote,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
      startTime: startTime?? this.startTime,
      endTime: endTime?? this.endTime,

    );
  }

  @override
  String toString() {
    return 'EventModel(id: $id, eventTitle: $eventTitle, repeatTime: $repeatTime, selectedIconIndex: $selectedIconIndex, addNote: $addNote, startDate: $startDate, endDate: $endDate, startTime : $startTime, endTime:$endTime ,isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.eventTitle == eventTitle &&
        other.repeatTime == repeatTime &&
        other.selectedIconIndex == selectedIconIndex &&
        other.addNote == addNote &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isAllDay == isAllDay;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    eventTitle.hashCode ^
    repeatTime.hashCode ^
    selectedIconIndex.hashCode ^
    addNote.hashCode ^
    startDate.hashCode ^
    endDate.hashCode ^
    startTime.hashCode ^
    endTime.hashCode ^
    isAllDay.hashCode;
  }
}
