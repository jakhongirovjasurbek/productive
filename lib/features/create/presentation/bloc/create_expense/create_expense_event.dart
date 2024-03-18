part of 'create_expense_bloc.dart';


@immutable
sealed class ExpenseEvent extends Equatable {}

class LoadingExpense extends ExpenseEvent {
  @override
  List<Object?> get props => [];
}

class SelectIconButton extends ExpenseEvent {
  final int index;

  SelectIconButton({
    required this.index,
  });

  @override
  List<Object?> get props => [];
}


class SelectIcon extends ExpenseEvent {
  int? indexColor;
  String? icon;
  SelectIcon({
    this.icon,
    this.indexColor,
  });

  @override
  List<Object?> get props => [];
}

class CreateNewExpense extends ExpenseEvent {
  final String title;
  final String icon;
  final int indexColor;
  final String description;
  final double price;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateNewExpense({
    required this.description,
    required this.price,
    required this.indexColor,
    required this.title,
    required this.icon,
    required this.onSuccess,
    required this.onFailure,
  });

  @override
  List<Object?> get props =>
      [title, icon,indexColor, description, price, onSuccess, onFailure];
}

class Searching extends ExpenseEvent {
  final String query;

  Searching({
    required this.query,
  });

  @override
  List<Object?> get props => [];
}
