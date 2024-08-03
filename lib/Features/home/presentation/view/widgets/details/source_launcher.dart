import 'package:flutter/material.dart';
import 'package:news_app/utils/helper_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../utils/text_styles.dart';
import '../../../../data/models/article.dart';
import '../cached_image.dart';

class SourceLauncher extends StatelessWidget {
  const SourceLauncher({
    super.key,
    required this.news,
  });

  final Article news;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(news.url!);
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: InkWell(
        onTap: urlLauncher,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  context.onPrimaryColor().withOpacity(0.3), BlendMode.srcOver),
              child: CachedImage(
                url: news.urlToImage!,
                boxFit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            Text(
              "News Source",
              style: Styles.textStyle28.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
