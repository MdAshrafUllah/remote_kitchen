class DataModel {
  String title;
  String body;

  DataModel({
    required this.title,
    required this.body,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        title: json['title'],
        body: json['body'],
      );
}
