part of 'income_bloc.dart';

abstract class IncomeEvent {}

class AddIncome extends IncomeEvent {
  final IncomePriority priority;
  final String title;
  final int usd;
  final String note;

  AddIncome({
    required this.priority,
    required this.title,
    required this.usd,
    required this.note,
  });
}

class ChangePriority extends IncomeEvent {
  final IncomePriority priorityName;

  ChangePriority({
    required this.priorityName,
  });
}
