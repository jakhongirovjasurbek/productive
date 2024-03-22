import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String eventTitle;
  final String eventIcon;
  final String repeatTime;
  final String iconEventColor;
  final String? addNote;
  final Timestamp startDate;
  final Timestamp endDate;
  final bool isAllDay;

  EventModel({
    required this.id,
    required this.eventTitle,
    required this.eventIcon,
    required this.repeatTime,
    required this.iconEventColor,
    this.addNote,
    required this.startDate,
    required this.endDate,
    required this.isAllDay,
  });

  factory EventModel.fromJson(Map<String, dynamic> json, String id) {
    return EventModel(
      id: id,
      eventTitle: json['eventTitle'],
      eventIcon: json['eventIcon'],
      addNote: json['addNote'],
      repeatTime: json['repeatTime'],
      iconEventColor: json['iconEventColor'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      isAllDay: json['isAllDay'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventTitle': eventTitle,
      'eventIcon': eventIcon,
      'addNote': addNote,
      'repeatTime': repeatTime,
      'iconEventColor': iconEventColor,
      'startDate': startDate,
      'endDate': endDate,
      'isAllDay': isAllDay,
    };
  }

  EventModel copyWith({
    String? id,
    String? eventTitle,
    String? eventIcon,
    String? repeatTime,
    String? iconEventColor,
    String? addNote,
    Timestamp? startDate,
    Timestamp? endDate,
    bool? isAllDay,
  }) {
    return EventModel(
      id: id ?? this.id,
      eventTitle: eventTitle ?? this.eventTitle,
      eventIcon: eventIcon ?? this.eventIcon,
      repeatTime: repeatTime ?? this.repeatTime,
      iconEventColor: iconEventColor ?? this.iconEventColor,
      addNote: addNote ?? this.addNote,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
    );
  }

  @override
  String toString() {
    return 'EventModel(id: $id, eventTitle: $eventTitle, eventIcon: $eventIcon, repeatTime: $repeatTime, iconEventColor: $iconEventColor, addNote: $addNote, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.eventTitle == eventTitle &&
        other.eventIcon == eventIcon &&
        other.repeatTime == repeatTime &&
        other.iconEventColor == iconEventColor &&
        other.addNote == addNote &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isAllDay == isAllDay;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    eventTitle.hashCode ^
    eventIcon.hashCode ^
    repeatTime.hashCode ^
    iconEventColor.hashCode ^
    addNote.hashCode ^
    startDate.hashCode ^
    endDate.hashCode ^
    isAllDay.hashCode;
  }
}
