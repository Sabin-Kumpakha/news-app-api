import '../models/news.dart';
import 'package:http/http.dart' as http;

Future<List<News>> getAllNews() async {
  String url = "https://jsonguide.technologychannel.org/news.json";
  final response = await http.get(Uri.parse(url));
  String data = response.body;
  List<News> allNews = newsFromJson(data);
  return allNews;
}
