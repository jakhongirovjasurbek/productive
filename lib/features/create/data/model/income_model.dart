import 'package:productive/features/create/data/model/income_status.dart';

class IncomeModel {
  final IncomePriority priority;
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
