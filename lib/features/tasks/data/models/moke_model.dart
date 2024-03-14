import 'package:cloud_firestore/cloud_firestore.dart';

class MockDataNotificationsModel {
  final Timestamp dateTime;
  final String title;
  final String subTitle;

  MockDataNotificationsModel({
    required this.dateTime,
    required this.title,
    required this.subTitle,
  });

  factory MockDataNotificationsModel.fromJson(Map<String, dynamic> json) {
    return MockDataNotificationsModel(
      subTitle: json['description'],
      dateTime: json['createdAt'],
      title: json['title'],
    );
  }
}
