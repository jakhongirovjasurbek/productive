import 'package:equatable/equatable.dart';
import 'package:productive/features/create/data/model/expense_model.dart';

class ExpenseEntity extends Equatable {
  final String title;
  final String description;
  final String icon;
  final num price;
  final int indexColor;
  final bool isIncome;
  final String name;

  const ExpenseEntity({
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
    required this.indexColor,
    required this.isIncome,
    required this.name,
  });

  factory ExpenseEntity.toEntity(ExpenseModel expenseModel) {
    return ExpenseEntity(
        title: expenseModel.title,
        description: expenseModel.description,
        icon: expenseModel.icon,
        price: expenseModel.price,
        indexColor: expenseModel.indexColor,
        isIncome: expenseModel.isIncome,
        name: expenseModel.name);
  }

  @override
  List<Object?> get props => [
        title,
        description,
        icon,
        price,
        indexColor,
        name,
        isIncome,
      ];
}
