import 'package:dio/dio.dart';

class NewsServices {
  final Dio _dio;

  final _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final _apiKey = "d683e15710854dedb49f415209e5dc37";
  NewsServices(this._dio);

  Future<List<dynamic>> getAllNews(String category) async {
    final response = await _dio
        .get('$_baseUrl?category=$category&apiKey=$_apiKey&language=en');
    return response.data["articles"];
  }
}
