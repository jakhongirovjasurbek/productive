class ExpenseModel {
  final String title;
  final String description;
  final String icon;
  final num price;
  final int indexColor;
  final String name;
  final bool isIncome;

  ExpenseModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
    required this.indexColor,
    required this.name,
    required this.isIncome,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json, String id) {
    return ExpenseModel(
      indexColor: json['index_color'] ?? 0,
      price: json['price'] ?? 0.0,
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      isIncome: json['is_income'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'is_income': isIncome,
      'name': name,
      'index_color': indexColor,
      'price': price,
      'title': title,
      'icon': icon,
      'description': description,
    };
  }

  ExpenseModel copyWith({
    String? title,
    String? description,
    String? icon,
    double? price,
    int? indexColor,
    String? name,
    bool? isIncome,
  }) {
    return ExpenseModel(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      price: price ?? this.price,
      indexColor: indexColor ?? this.indexColor,
      name: name ?? this.name,
      isIncome: isIncome ?? this.isIncome,
    );
  }

  @override
  String toString() {
    return 'ExpenseModel(title: $title, description: $description, icon: $icon, price: $price, indexColor: $indexColor, name: $name, isIncome: $isIncome)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.icon == icon &&
        other.price == price &&
        other.indexColor == indexColor &&
        other.name == name &&
        other.isIncome == isIncome;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        price.hashCode ^
        indexColor.hashCode ^
        name.hashCode ^
        isIncome.hashCode;
  }
}
