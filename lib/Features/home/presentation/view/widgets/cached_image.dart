import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/helper_extensions.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit boxFit;
  final double? height;
  final double? width;
  const CachedImage(
      {super.key,
      required this.url,
      required this.boxFit,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: context.onPrimaryColor(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
