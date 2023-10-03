import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constant/api_endpoints.dart';
import 'package:news_app/model/news_response.dart';

class ApiService {
  final String apiKey = 'd2af0da595bd49538c12b60e921d3b77';

  Future<NewsResponse> fetchNews() async {
    final Uri uri = Uri.parse('${ApiEndPoints.url}$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> map =
          jsonDecode(response.body) as Map<String, dynamic>;
      return NewsResponse.fromJson(map);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
