import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router/app_router.dart';
import 'themes.dart';

void main() async {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
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
      //darkTheme: darkMode,
    );
  }
}
