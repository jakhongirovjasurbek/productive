part of 'income_bloc.dart';

abstract class IncomeEvent {}

class AddIncome extends IncomeEvent {
  final IncomePriority priority;
  final String title;
  final int usd;
  final String note;
  final String iconUrl;

  AddIncome(
      {required this.priority,
      required this.title,
      required this.usd,
      required this.note,
      required this.iconUrl});
}

class ChangePriority extends IncomeEvent {
  final IncomePriority priorityName;

  ChangePriority({
    required this.priorityName,
  });
}

class EditDisablding extends IncomeEvent {
  final String title;
  final int usd;
  final String note;

  EditDisablding({
    required this.title,
    required this.usd,
    required this.note,
  });
}
