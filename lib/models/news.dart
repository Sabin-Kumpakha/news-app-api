import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    required this.title,
    required this.link,
    required this.image,
    required this.date,
    required this.category,
  });

  String title;
  String link;
  String image;
  DateTime date;
  String category;

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        link: json["link"],
        image: json["image"],
        date: DateTime.parse(json["date"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "image": image,
        "date": date.toIso8601String(),
        "category": category,
      };
}
