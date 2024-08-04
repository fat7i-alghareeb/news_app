import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/home/data/models/article.dart';
import 'package:news_app/Features/home/data/models/source.dart';
import 'shared/models/user.dart';
import 'utils/constants.dart';
import 'utils/router/app_router.dart';
import 'utils/service_locator.dart';
import 'utils/themes.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<List<dynamic>>(kArticlesBox);
  await Hive.openBox<User>(kUser);

  setupServiceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}
