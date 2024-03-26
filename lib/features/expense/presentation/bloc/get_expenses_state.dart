part of 'get_expenses_bloc.dart';

class GetExpenseState {
  final List<ExpenseEntity> expenses;
  final Status status;
  GetExpenseState({
    required this.expenses,
    required this.status,
  });

  GetExpenseState copyWith({
    List<ExpenseEntity>? expenses,
    Status? status,
  }) {
    return GetExpenseState(
      expenses: expenses ?? this.expenses,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'GetExpenseState(expenses: $expenses, status: $status)';

  @override
  bool operator ==(covariant GetExpenseState other) {
    if (identical(this, other)) return true;

    return listEquals(other.expenses, expenses) && other.status == status;
  }

  @override
  int get hashCode => expenses.hashCode ^ status.hashCode;
}

class GetExpensesList {
  final List<ExpenseEntity> expenses;
  GetExpensesList({
    required this.expenses,
  });

  GetExpensesList copyWith({
    List<ExpenseEntity>? expenses,
  }) {
    return GetExpensesList(
      expenses: expenses ?? this.expenses,
    );
  }

  @override
  String toString() => 'GetExpensesList(expenses: $expenses)';

  @override
  bool operator ==(covariant GetExpensesList other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.expenses, expenses);
  }

  @override
  int get hashCode => expenses.hashCode;
}

enum Status { pure, success, fail, loading }
