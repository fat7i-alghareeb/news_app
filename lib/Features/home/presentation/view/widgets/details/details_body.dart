import 'package:flutter/material.dart';

import '../../../../../../utils/functions/format_date_string.dart';
import '../../../../../../utils/text_styles.dart';
import '../../../../data/models/news.dart';
import '../cached_image.dart';
import 'source_launcher.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        CachedImage(
          url: news.image,
          boxFit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, size.height * .39, 0.0, 0.0),
          child: SizedBox(
            height: size.height * 1.75,
            width: size.width,
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: Text(news.title, style: Styles.textStyle30),
                  ),
                  Chip(
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                    backgroundColor: Colors.pink[300],
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    label: Text(formatDateString(news.publishedAt),
                        style: Styles.textStyle20),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(news.description, style: Styles.textStyle25),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(news.content, style: Styles.textStyle25),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    // margin: const EdgeInsets.only(bottom: 4),
                    child: Chip(
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      backgroundColor: Colors.pink[300],
                      labelStyle: Styles.textStyle,
                      label: Text("Author : ${news.author}",
                          style: Styles.textStyle15.copyWith(
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                  SourceLauncher(news: news),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
