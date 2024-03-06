class MockDataNotificationsModel {
  final int id;
  final String title;
  final String subTitle;

  MockDataNotificationsModel({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  factory MockDataNotificationsModel.fromJson(Map<String, dynamic> json) {
    return MockDataNotificationsModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
    );
  }
}
