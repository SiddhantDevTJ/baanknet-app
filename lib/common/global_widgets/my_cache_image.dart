import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget:
            (context, url, error) => const Center(child: Icon(Icons.broken_image, color: Colors.grey, size: 40)),
      ),
    );
  }
}
