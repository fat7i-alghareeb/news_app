import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/home/data/models/article.dart';
import 'package:news_app/Features/home/data/models/source.dart';
import 'shared/cubit/user_info_cubit.dart';
import 'shared/cubit/user_info_state.dart';
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
  await Hive.openBox<int>("time");
  await Hive.openBox<User>(kUser);

  setupServiceLocator();

  runApp(BlocProvider(
    create: (context) => UserInfoCubit()..saveUser(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    bool userSelectedTheme = BlocProvider.of<UserInfoCubit>(context).userTheme;
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarColor:
    //         userSelectedTheme ? Colors.amber : Colors.black,
    //   ),
    // );
    return BlocListener<UserInfoCubit, UserInfoState>(
      listener: (context, state) {
        if (state is EditThemeUserInfo) {
          userSelectedTheme =
              !BlocProvider.of<UserInfoCubit>(context).userTheme;
          setState(() {});
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        onGenerateRoute: _appRouter.generateRoute,
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: userSelectedTheme ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }
}
