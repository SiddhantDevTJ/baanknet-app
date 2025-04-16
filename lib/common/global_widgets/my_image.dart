import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final FilterQuality filterQuality;
  final BorderRadius? borderRadius;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  const MyImage({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.low,
    this.borderRadius,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.border,
    this.margin,
    this.padding,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      assetName,
      width: width,
      height: height,
      color: color,
      fit: fit,
      alignment: alignment,
      filterQuality: filterQuality,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
    );

    // Apply border radius if provided
    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    // Apply container decorations if any are provided
    if (border != null || boxShadow != null || padding != null || margin != null) {
      imageWidget = Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(border: border, borderRadius: borderRadius, boxShadow: boxShadow),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
