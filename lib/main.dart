import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/router/app_router.dart';
import 'utils/service_locator.dart';
import 'utils/themes.dart';

void main() async {
  setupServiceLocator();

  runApp(MyApp());
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent,
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: 2 < 4 ? Color(0xFFFFF4F7) : Color(0xff1b2026),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      //darkTheme: darkMode,
    );
  }
}
