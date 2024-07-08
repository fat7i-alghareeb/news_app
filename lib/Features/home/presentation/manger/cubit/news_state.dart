import '../../../data/models/article.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<Article> news;
  final List<Article> latestNews;
  NewsLoaded({required this.news, required this.latestNews});
}

final class NewsFailure extends NewsState {
  final String message;

  NewsFailure({required this.message});
}

final class NewsLoading extends NewsState {}
