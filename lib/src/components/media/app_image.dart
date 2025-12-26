import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/extensions/context_extension.dart';
import 'app_image_source.dart';
import 'app_image_placeholder.dart';

class AppImage extends StatelessWidget {
  final AppImageSource source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    final radius = borderRadius ?? BorderRadius.circular(style.radius.sm);

    return ClipRRect(borderRadius: radius, child: _buildImage(context));
  }

  Widget _buildImage(BuildContext context) {
    switch (source.type) {
      case AppImageType.asset:
        return Image.asset(
          source.path!,
          width: width,
          height: height,
          fit: fit,
        );

      case AppImageType.network:
        return Image.network(
          source.path!,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (_, _, _) => const AppImagePlaceholder(),
        );

      case AppImageType.cachedNetwork:
        return CachedNetworkImage(
          imageUrl: source.path!,
          width: width,
          height: height,
          fit: fit,
          placeholder: (_, _) => const AppImagePlaceholder(),
          errorWidget: (_, _, _) => const AppImagePlaceholder(),
        );

      case AppImageType.file:
        return Image.file(source.file!, width: width, height: height, fit: fit);

      case AppImageType.svgAsset:
        return SvgPicture.asset(
          source.path!,
          width: width,
          height: height,
          fit: fit,
        );

      case AppImageType.svgNetwork:
        return SvgPicture.network(
          source.path!,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (_) => const AppImagePlaceholder(),
        );
    }
  }
}
