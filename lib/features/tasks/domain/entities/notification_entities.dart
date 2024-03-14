import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationEntities {
  final Timestamp dateTime;
  final String title;
  final String subTitle;

  NotificationEntities({
    required this.dateTime,
    required this.title,
    required this.subTitle,
  });
}
