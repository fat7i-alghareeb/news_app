import '../models/news.dart';

abstract class NewsRepo {
  Future<List<News>> fetchNews(String category);
}
