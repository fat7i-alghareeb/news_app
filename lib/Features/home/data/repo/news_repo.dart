import '../../../../utils/errors/failures.dart';
import '../models/news.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<News>>> fetchNews(String category);
}
