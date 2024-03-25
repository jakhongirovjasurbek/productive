// ignore_for_file: public_member_api_docs, sort_constructors_first
class CalendarEntities {
  final String iconColor;
 final String title;
  final String? description;
  final String icon;
  final DateTime startTime;
  final DateTime endTime;
  final String priority;
  CalendarEntities( {
    required this.priority,
    required this.iconColor,
    required this.title,
    this.description,
    required this.icon,
    required this.startTime,
    required this.endTime,
  });
  
}
