import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../app_image.dart';
import '../app_image_source.dart';

class AppAvatar extends StatelessWidget {
  final AppImageSource? image;
  final double size;
  final String? initials;
  final Color? backgroundColor;

  const AppAvatar({
    super.key,
    this.image,
    this.size = 40,
    this.initials,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    if (image != null) {
      return AppImage(
        source: image!,
        width: size,
        height: size,
        borderRadius: BorderRadius.circular(size / 2),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? style.colors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials ?? '',
        style: style.typography.body.copyWith(
          color: style.colors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
