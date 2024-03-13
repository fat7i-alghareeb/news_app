import '../models/news.dart';
import '../services/news_services.dart';

class NewsRepo {
  final NewsServices newsServices;

  NewsRepo({required this.newsServices});

  Future<List<News>> fetchNews(String category) async {
    try {
      final news = await newsServices.getAllNews(category);
      //print(products.map((product) => Product.fromJson(product)).toList());
      return news.map((news) => News.fromJson(news)).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
