part of 'income_bloc.dart';

abstract class IncomeEvent {}

class AddIncome extends IncomeEvent {
  final IncomePrio prio;
  final String title;
  final int usd;
  final String note;

  AddIncome({
    required this.prio,
    required this.title,
    required this.usd,
    required this.note,
  });
}

class ChangePriority extends IncomeEvent {
  final IncomePrio prio;

  ChangePriority({
    required this.prio,
  });
}
