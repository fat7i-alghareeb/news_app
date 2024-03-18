import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/cubit/news_cubit.dart';
import '../manger/cubit/news_state.dart';

import '../../data/models/news.dart';
import 'widgets/shimmer_widgets.dart';
import 'widgets/single_news_widget.dart';
import 'widgets/swiper_widget.dart';

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
    BlocProvider.of<NewsCubit>(context).fetchNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return LoadedView(news: state.news, latestNews: state.latestNews);
        } else if (state is NewsLoading) {
          return const MainScreenShimmer();
        } else {
          return const Text("error");
        }
      },
    );
  }
}

class LoadedView extends StatelessWidget {
  final List<News> news;
  final List<News> latestNews;
  const LoadedView({
    super.key,
    required this.news,
    required this.latestNews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SwiperWidget(news: latestNews),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 120 * news.length.toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsWidget(news: news[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
