import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Features/home/data/models/article.dart';

import '../../../../utils/errors/failures.dart';
import 'news_repo.dart';

import '../../../../utils/services/news_services.dart';

class NewsRepoImp implements NewsRepo {
  final NewsServices newsServices;

  NewsRepoImp({required this.newsServices});

  @override
  Future<Either<Failure, List<Article>>> fetchNews(String category) async {
    try {
      final data = await newsServices.getAllNews({
        "apiKey": "d683e15710854dedb49f415209e5dc37",
        "category": category,
        "language": "en",
        "pageSize": 50,
      });
      List<Article> news = data.articles;
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
