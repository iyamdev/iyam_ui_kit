import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppSkeleton extends StatelessWidget {
  final double height;
  final double width;

  const AppSkeleton({
    super.key,
    this.height = 16,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: style.colors.disabled.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(style.radius.sm),
      ),
    );
  }
}
