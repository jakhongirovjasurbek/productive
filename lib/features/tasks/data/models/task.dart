import 'package:flutter/cupertino.dart';

class TaskModel {
  final String title;
  final String icon;
  final String priority;
  final String? note;
  final DateTime startDate;
  final DateTime dueDate;

  TaskModel({
    required this.title,
    required this.icon,
    required this.priority,
    this.note,
    required this.startDate,
    required this.dueDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      icon: json['icon'],
      note: json['note'],
      priority: json['priority'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
      'note': note,
      'priority': priority,
      'start_date': startDate,
      "due_date": dueDate,
    };
  }

  @override
  String toString() {
    return 'TaskModel( title: $title, icon: $icon, priority: $priority, note: $note, startDate: $startDate, dueDate: $dueDate,)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.icon == icon &&
        other.priority == priority &&
        other.note == note &&
        other.startDate == startDate &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        icon.hashCode ^
        priority.hashCode ^
        note.hashCode ^
        startDate.hashCode ^
        dueDate.hashCode;
  }

  TaskModel copyWith({
    String? title,
    String? icon,
    String? priority,
    String? note,
    DateTime? startDate,
    DateTime? dueDate,
    Color? iconColor,
  }) {
    return TaskModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}
