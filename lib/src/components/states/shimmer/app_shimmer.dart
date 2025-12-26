import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/extensions/context_extension.dart';

class AppShimmer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const AppShimmer({
    super.key,
    this.height = 16,
    this.width = double.infinity,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Shimmer.fromColors(
      baseColor: style.colors.disabled.withValues(alpha: 0.3),
      highlightColor: style.colors.disabled.withValues(alpha: 0.1),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(style.radius.sm),
        ),
      ),
    );
  }
}
