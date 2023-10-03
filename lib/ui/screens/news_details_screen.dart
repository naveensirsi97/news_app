import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  String? imageUrl = '';
  String? desc = '';
  String? content = '';
  String? title = '';

  NewsDetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.desc,
      required this.title,
      required this.content});
  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl.toString()),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.title.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.desc.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(widget.content.toString())
            ],
          ),
        ),
      ),
    );
  }
}
