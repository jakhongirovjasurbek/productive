import 'package:productive/core/create_status/income_status.dart';

class IncomeModel {
  final IncomePrio priority;
  final String title;
  final int usd;
  final String note;

  IncomeModel({
    required this.priority,
    required this.title,
    required this.usd,
    required this.note,
  });

  @override
  String toString() {
    return 'IncomeModel{priority: $priority, title: $title, usd: $usd, note: $note}';
  }
}
