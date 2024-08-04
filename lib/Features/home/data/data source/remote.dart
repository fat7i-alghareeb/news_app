import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/home/data/models/article.dart';
import 'package:news_app/utils/services/news_services.dart';

import '../../../../utils/constants.dart';

class RemoteData {
  final NewsServices newsServices;

  RemoteData({required this.newsServices});
  Future<List<Article>> fetchNews(String category) async {
    final data = await newsServices.getAllNews({
      "apiKey": "d683e15710854dedb49f415209e5dc37",
      "category": category,
      "language": "en",
      "pageSize": 50,
    });
    var box = Hive.box<List<dynamic>>(kArticlesBox);
    await box.put(category, data.articles);
    return data.articles;
  }
}
