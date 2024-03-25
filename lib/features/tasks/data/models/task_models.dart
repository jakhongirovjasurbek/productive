import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable{
  final String? id;
  final String title;
  final String icon;
  final String priority;
  final String iconColor;
  final String? note;
  final Timestamp startDate;
  final Timestamp dueDate;
  final bool isChecked;
  final GeoPoint? position;
  const TaskModel({
     this.id,
    required this.title,
    required this.icon,
    required this.priority,
    required this.iconColor,
    this.note,
    required this.startDate,
    required this.dueDate,
    required this.isChecked,
    this.position,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      note: json['note'] ?? '',
      priority: json['priority'] ?? '',
      iconColor: json['iconColor'] ?? "",
      startDate: json['created_at'] ?? Timestamp.now(),
      dueDate: json['due_date'] ?? Timestamp.now(),
      isChecked: json['is_finished'] ?? false,
      position: json['position'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
      'note': note,
      'priority' : priority,
      'iconColor' : iconColor,
      'created_at' : startDate,
      'due_date' : dueDate,
      'is_finished' : isChecked,
      'position' : position,
    };
  }
  @override
  List<Object?> get props => [
    id,
    title,
    icon,
    note,
    priority,
    iconColor,
    startDate,
    dueDate,
    isChecked,
    position,
  ];


}

