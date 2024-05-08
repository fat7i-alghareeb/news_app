import '../../../data/models/news.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<News> news;
  final List<News> latestNews;
  NewsLoaded({required this.news, required this.latestNews});
}

final class NewsFailure extends NewsState {
  final String message;

  NewsFailure({required this.message});
}

final class NewsLoading extends NewsState {}
