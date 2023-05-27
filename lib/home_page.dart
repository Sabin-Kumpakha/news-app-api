import 'package:api_news_app/models/news.dart';
import 'package:api_news_app/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Nepali News App"),
      ),
      body: FutureBuilder<List<News>>(
        future: getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].image),
                      Text(snapshot.data![index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
