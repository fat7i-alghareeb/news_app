import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failures.dart';
import '../models/news.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<News>>> fetchNews(String category);
}
