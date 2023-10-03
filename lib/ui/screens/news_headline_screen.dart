import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/ui/screens/news_details_screen.dart';

class NewsHeadLineScreen extends StatefulWidget {
  const NewsHeadLineScreen({super.key});

  @override
  State<NewsHeadLineScreen> createState() => _NewsHeadLineScreenState();
}

class _NewsHeadLineScreenState extends State<NewsHeadLineScreen> {
  final ApiService apiService = ApiService();
  List<Articles> newsList = [];

  Future<void> fetchData() async {
    try {
      final newsResponse = await apiService.fetchNews();
      if (newsResponse.articles != null) {
        setState(() {
          newsList = newsResponse.articles!;
        });
      }
    } catch (e) {
      print('API error: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('News')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView.builder(
          itemCount: newsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  newsList[index].title.toString(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  newsList[index].description ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                trailing: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(newsList[index].urlToImage ??
                            "https://image.shutterstock.com/image-vector/no-image-vector-symbol-missing-260nw-1310632172.jpg"),
                      )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        imageUrl: newsList[index].urlToImage,
                        desc: newsList[index].description,
                        title: newsList[index].title,
                        content: newsList[index].content,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
