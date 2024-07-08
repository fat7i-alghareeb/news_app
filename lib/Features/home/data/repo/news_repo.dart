import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failures.dart';
import '../models/article.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<Article>>> fetchNews(String category);
}
