import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsServices {
  final apiKey = "d683e15710854dedb49f415209e5dc37";
  Future<List<dynamic>> getAllNews(String category) async {
    final uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey&language=en');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body)['articles'];
    } else {
      throw Exception("error in api");
    }
  }
}
