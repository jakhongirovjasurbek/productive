// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarModel {
  final bool isFinished;
  final GeoPoint? position;
  final String title;
  final String? description;
  final String icon;
  final Timestamp startTime;
  final Timestamp endTime;
  final String iconColor;
  final String priority;

  CalendarModel({
    required this.isFinished,
    required this.position,
    required this.title,
    this.description,
    required this.icon,
    required this.startTime,
    required this.endTime,
    required this.iconColor,
    required this.priority,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      position: json["position"]  ,     //?? const GeoPoint(0, 0),
      priority: json['priority'],
      isFinished: json['is_finished'],
      iconColor: json["iconColor"],
      title: json['title'],
      icon: json['icon'],
      startTime: json['created_at'],
      endTime: json['due_date'],
      description: json['note'],
    );
  }
}
