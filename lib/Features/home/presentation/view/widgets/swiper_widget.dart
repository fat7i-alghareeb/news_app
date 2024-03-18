import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'cached_image.dart';

import '../../../../../constants.dart';
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
      onTap: () => Navigator.pushNamed(context, detailsScreen, arguments: news),
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
                    child: const Text(
                      'Latest News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        //  fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    news.title,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        formatDateString(news.publishedAt),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        ' | ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        news.sourceName,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
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
