import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
  final String id;
  final String title;
  final String icon;
  final String priority;
  final String iconColor;
  final String? note;
  final Timestamp startDate;
  final Timestamp dueDate;
  final bool isChecked;
  final GeoPoint? position;
  const TaskEntity({
    required this.id,
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
    position
  ];

  TaskEntity copyWith({
    String? id,
    String? title,
    String? icon,
    String? priority,
    String? iconColor,
    String? note,
    Timestamp? startDate,
    Timestamp? dueDate,
    bool? isChecked,
    GeoPoint? position,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      iconColor: iconColor ?? this.iconColor,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked,
      position: position ?? this.position,
    );
  }
}
