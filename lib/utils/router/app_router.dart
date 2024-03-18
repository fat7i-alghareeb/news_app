import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/home/presentation/view/details_screen.dart';
import '../../Features/home/presentation/manger/cubit/news_cubit.dart';
import '../../Features/home/data/models/news.dart';
import '../../Features/home/data/repo/news_repo_impl.dart';
import '../services/news_services.dart';

import '../../constants.dart';
import '../../Features/home/presentation/view/navigator.dart';

class AppRouter {
  late NewsRepoImp newsRepo;
  late NewsServices newsServices;
  AppRouter() {
    newsServices = NewsServices();
    newsRepo = NewsRepoImp(newsServices: newsServices);
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainNavigator:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit(newsRepo),
            child: const MainNavigator(),
          ),
        );
      case detailsScreen:
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
