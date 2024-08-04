import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/Features/home/data/data%20source/local.dart';
import 'package:news_app/Features/home/data/data%20source/remote.dart';
import '../Features/home/data/repo/news_repo_impl.dart';
import 'services/news_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<NewsServices>(NewsServices(createAndSetupDio()));
  getIt.registerSingleton<NewsRepoImp>(
    NewsRepoImp(
      localData: LocalData(),
      remoteData: RemoteData(
        newsServices: getIt<NewsServices>(),
      ),
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
