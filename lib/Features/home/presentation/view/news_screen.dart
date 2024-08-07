import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/utils/functions/check_cache.dart';
import 'package:news_app/utils/helper_extensions.dart';
import 'widgets/home/news_body.dart';
import '../manger/cubit/news_cubit.dart';
import '../manger/cubit/news_state.dart';
import 'widgets/shimmer_widgets.dart';

class NewsScreen extends StatefulWidget {
  final String category;
  const NewsScreen({super.key, required this.category});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    checkCache(category: widget.category).then(
      (value) {
        BlocProvider.of<NewsCubit>(context).fetchNews(widget.category);
      },
    );
  }

  Future<void> _handleRefresh() async {
    final newsCubit = BlocProvider.of<NewsCubit>(context);
    await checkCache(category: widget.category, clearNow: true);
    await newsCubit.fetchNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: context.accentColor(),
      backgroundColor: context.primaryColor(),
      onRefresh: _handleRefresh,
      animSpeedFactor: 3,
      springAnimationDurationInMilliseconds: 700,
      showChildOpacityTransition: false,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            return NewsBody(news: state.news, latestNews: state.latestNews);
          } else if (state is NewsFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const MainScreenShimmer();
          }
        },
      ),
    );
  }
}
