import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/functions/format_date_string.dart';
import '../../../../../utils/router/router_paths.dart';
import '../../../../../utils/text_styles.dart';
import 'cached_image.dart';

import '../../../data/models/news.dart';

class SwiperWidget extends StatelessWidget {
  final List<News> news;
  const SwiperWidget({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        viewportFraction: 0.9,
        scale: 0.93,
        itemCount: news.length,
        duration: 800,
        autoplayDelay: 3000,
        autoplay: true,
        itemBuilder: (context, index) {
          return ImageSliderWidget(news: news[index]);
        },
      ),
    );
  }
}

class ImageSliderWidget extends StatelessWidget {
  final News news;
  const ImageSliderWidget({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, KRouter.detailsScreen, arguments: news),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CachedImage(url: news.image, boxFit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.fromLTRB(8, 3, 8, 7),
                    child: Text('Latest News',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                  const SizedBox(height: 3),
                  Text(news.title, maxLines: 2, style: Styles.textStyle18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(formatDateString(news.publishedAt),
                          style: Styles.textStyle15),
                      Text(' | ',
                          style: Styles.textStyle15.copyWith(fontSize: 18)),
                      Text(news.sourceName, style: Styles.textStyle15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
