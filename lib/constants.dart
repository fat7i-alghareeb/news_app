import 'package:intl/intl.dart';

import 'Features/home/data/models/news.dart';

const String mainNavigator = "/";
const String detailsScreen = "/detailsScreen";
String formatDateString(String dateString) {
  DateTime date = DateTime.parse(dateString);

  String formattedDate = DateFormat('MMM d, yyyy HH:mm').format(date);

  return formattedDate;
}

List<News> removeEmptyFields(List<News> newsList) {
  return newsList.where((news) {
    return news.id.isNotEmpty &&
        news.image.isNotEmpty &&
        news.title.isNotEmpty &&
        news.publishedAt.isNotEmpty &&
        news.sourceName.isNotEmpty;
  }).toList();
}
