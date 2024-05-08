import 'package:flutter/material.dart';

import '../Features/home/presentation/view/news_screen.dart';

final List<Widget> categories = [
  const NewsScreen(category: "general"),
  const NewsScreen(category: "health"),
  const NewsScreen(category: "science"),
  const NewsScreen(category: "sports"),
  const NewsScreen(category: "technology"),
  const NewsScreen(category: "business"),
  const NewsScreen(category: "entertainment"),
];

const double kBorderRadius = 8;
