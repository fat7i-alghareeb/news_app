import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/pages/details_screen.dart';
import '../business_logic/cubit/news_cubit.dart';
import '../data/models/news.dart';
import '../data/repo/news_repo.dart';
import '../data/services/news_services.dart';

import '../constants.dart';
import '../presentation/pages/navigator.dart';

class AppRouter {
  late NewsRepo newsRepo;
  late NewsServices newsServices;
  AppRouter() {
    newsServices = NewsServices();
    newsRepo = NewsRepo(newsServices: newsServices);
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
