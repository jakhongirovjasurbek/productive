class ExpenseModel  {
  final String title;
  final String description;
  final String icon;
  final double price;
  final int indexColor;

  ExpenseModel({
    required this.indexColor,
    required this.price,
    required this.title,
    required this.icon,
    required this.description,

  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json, String id) {
    return ExpenseModel(
      indexColor: json['index_color'] ?? 0,
      price: json['price'] ?? 0.0,
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'index_color' : indexColor,
      'price' : price,
      'title': title,
      'icon': icon,
      'description': description,
    };
  }
}
