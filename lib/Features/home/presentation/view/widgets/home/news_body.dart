import 'package:flutter/material.dart';
import '../../../../data/models/article.dart';
import '../single_news_widget.dart';
import 'swiper_widget.dart';

class NewsBody extends StatelessWidget {
  final List<Article> news;
  final List<Article> latestNews;
  const NewsBody({
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
