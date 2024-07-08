import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../Features/home/data/repo/news_repo_impl.dart';
import 'services/news_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<NewsServices>(NewsServices(createAndSetupDio()));
  getIt.registerSingleton<NewsRepoImp>(
    NewsRepoImp(
      newsServices: getIt.get<NewsServices>(),
    ),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(milliseconds: 20000)
    ..options.receiveTimeout = const Duration(milliseconds: 20000);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
