import 'package:dio/dio.dart';
import 'package:news_app/Features/home/data/models/news_response.dart';
import 'package:retrofit/http.dart';
part 'news_services.g.dart';
//final _apiKey = "d683e15710854dedb49f415209e5dc37";

@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NewsServices {
  factory NewsServices(Dio dio, {String baseUrl}) = _NewsServices;

  @GET('/top-headlines')
  Future<NewsResponse> getAllNews(@Queries() Map<String, dynamic> map);
}
