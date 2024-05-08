import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../utils/errors/failures.dart';
import 'news_repo.dart';

import '../models/news.dart';
import '../../../../utils/services/news_services.dart';

class NewsRepoImp implements NewsRepo {
  final NewsServices newsServices;

  NewsRepoImp({required this.newsServices});

  @override
  Future<Either<Failure, List<News>>> fetchNews(String category) async {
    try {
      final data = await newsServices.getAllNews(category);
      final news = data.map((news) => News.fromJson(news)).toList();
      return right(news);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDiorError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
