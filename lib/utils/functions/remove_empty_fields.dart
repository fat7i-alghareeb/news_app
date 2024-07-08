import 'package:news_app/Features/home/data/models/article.dart';

List<Article> removeEmptyFields(List<Article> newsList) {
  return newsList.where((news) {
    return news.urlToImage!.isNotEmpty;
  }).toList();
}
