import 'package:flutter/material.dart';
import '../../data/models/article.dart';
import 'widgets/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Article news;
  const DetailsScreen({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DetailsBody(news: news),
      ),
    );
  }
}
