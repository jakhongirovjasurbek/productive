import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final int id;
  final String title;
  final int colorIndex;
  final String icon;
  final double price;
  final String description;
  const ExpenseModel({
    required this.id,
    required this.title,
    required this.colorIndex,
    required this.icon,
    required this.price,
    required this.description,
  });

  factory ExpenseModel.fromJson(DataMap json) {
    return ExpenseModel(
        id: json['id'],
        title: json['title'] ?? ' ',
        icon: json['icon']  ?? ' ',
        colorIndex: json['colorIndex'] ?? 0,
        price: json['price'] ?? 0.0,
        description: json['description']  ?? ' '
    );}



  DataMap toJson() =>
      {
        'id': id,
        'icon': icon,
        'price' : price,
        'colorIndex' : colorIndex,
        'title': title,
        'description': description
      };


  @override
  List<Object?> get props =>[id,title, colorIndex,description,icon,price];
}

typedef DataMap = Map<String, dynamic>;