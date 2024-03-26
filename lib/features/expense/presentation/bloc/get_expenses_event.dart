part of 'get_expenses_bloc.dart';

abstract class GetExpensesEvent {}

class GetExpensesEventStarted implements GetExpensesEvent {}

class GetExpensesListEventStarted implements GetExpensesEvent{}
