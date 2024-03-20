
import '../../Features/home/data/models/news.dart';

List<News> removeEmptyFields(List<News> newsList) {
  return newsList.where((news) {
    return news.id.isNotEmpty &&
        news.image.isNotEmpty &&
        news.title.isNotEmpty &&
        news.publishedAt.isNotEmpty &&
        news.sourceName.isNotEmpty;
  }).toList();
}
