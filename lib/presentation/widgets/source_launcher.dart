import 'package:flutter/material.dart';
import 'cached_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/news.dart';

class SourceLauncher extends StatelessWidget {
  const SourceLauncher({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(news.url);
    Future<void> urlLauncher() async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      elevation: 20,
      color: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: InkWell(
        onTap: urlLauncher,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black12.withOpacity(0.3), BlendMode.srcOver),
              child: CachedImage(
                url: news.image,
                boxFit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const Text(
              "News Source",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
                fontFamily: "font2",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
