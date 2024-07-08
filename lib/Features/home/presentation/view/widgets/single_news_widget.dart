import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/functions/format_date_string.dart';
import '../../../../../utils/router/router_paths.dart';
import '../../../../../utils/text_styles.dart';
import '../../../data/models/article.dart';
import 'cached_image.dart';

class NewsWidget extends StatelessWidget {
  final Article news;
  const NewsWidget({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, KRouter.detailsScreen,
            arguments: news),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: CachedImage(
                  url: news.urlToImage!,
                  width: 100,
                  height: 100,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(news.title!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle15.copyWith(
                              color: Theme.of(context).colorScheme.secondary)),
                    ),
                    Text(news.author ?? "Known", style: Styles.textStyle12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(formatDateString(news.publishedAt!),
                            style: Styles.textStyle10),
                        const Text(' | ', style: Styles.textStyle12),
                        Text(news.source!.name!, style: Styles.textStyle10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
