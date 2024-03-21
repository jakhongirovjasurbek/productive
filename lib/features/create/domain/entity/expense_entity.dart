import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String title;
  final String description;
  final String icon;
  final double price;
  final int indexColor;

  const ExpenseEntity({
    required this.title,
    required this.description,
    required this.indexColor,
    required this.price,
    required this.icon,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    icon,
    price,
    indexColor,
  ];
}
