import 'package:get_it/get_it.dart';
import '../Features/home/data/repo/news_repo_impl.dart';
import 'services/news_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<NewsServices>(NewsServices());
  getIt.registerSingleton<NewsRepoImp>(
    NewsRepoImp(
      newsServices: getIt.get<NewsServices>(),
    ),
  );
}
