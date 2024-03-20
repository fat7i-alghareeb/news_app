import 'news_repo.dart';

import '../models/news.dart';
import '../../../../utils/services/news_services.dart';

class NewsRepoImp implements NewsRepo {
  final NewsServices newsServices;

  NewsRepoImp({required this.newsServices});

  @override
  Future<List<News>> fetchNews(String category) async {
    try {
      final news = await newsServices.getAllNews(category);
      return news.map((news) => News.fromJson(news)).toList();
    } catch (e) {
      return [];
    }
  }
}
