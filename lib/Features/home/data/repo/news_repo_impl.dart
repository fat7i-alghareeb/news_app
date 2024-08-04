import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Features/home/data/data%20source/local.dart';
import 'package:news_app/Features/home/data/data%20source/remote.dart';
import 'package:news_app/Features/home/data/models/article.dart';
import '../../../../utils/errors/failures.dart';
import 'news_repo.dart';

class NewsRepoImp implements NewsRepo {
  final LocalData localData;
  final RemoteData remoteData;
  NewsRepoImp({required this.localData, required this.remoteData});

  @override
  Future<Either<Failure, List<Article>>> fetchNews(String category) async {
    List<Article> news;
    try {
      news = localData.fetchLocalArticles(category: category);
      if (news.isNotEmpty) {
        return right(news);
      }
      news = await remoteData.fetchNews(category);
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
