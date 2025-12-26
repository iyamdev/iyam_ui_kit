import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final Color? color;

  const AppBadge({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? style.colors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(style.radius.sm),
      ),
      child: Text(
        label,
        style: style.typography.caption.copyWith(color: style.colors.primary),
      ),
    );
  }
}
