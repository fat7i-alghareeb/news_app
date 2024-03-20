import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'router_paths.dart';
import '../service_locator.dart';
import '../../Features/home/presentation/view/details_screen.dart';
import '../../Features/home/presentation/manger/cubit/news_cubit.dart';
import '../../Features/home/data/models/news.dart';
import '../../Features/home/data/repo/news_repo_impl.dart';
import '../../Features/home/presentation/view/navigator.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KRouter.mainNavigator:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit(getIt.get<NewsRepoImp>()),
            child: const MainNavigator(),
          ),
        );
      case KRouter.detailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final News news = settings.arguments as News;
            return DetailsScreen(news: news);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
