import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/home/data/models/article.dart';

import '../../../../utils/constants.dart';

class LocalData {
  List<Article> fetchLocalArticles({required String category}) {
    final box = Hive.box<List<dynamic>>(kArticlesBox);
    final dynamicArticles = box.get(category, defaultValue: []);
    List<Article> articles =
        dynamicArticles?.map((dynamic item) => item as Article).toList() ?? [];
    return articles;
  }
}
