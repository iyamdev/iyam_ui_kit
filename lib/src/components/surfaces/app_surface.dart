import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppSurface extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool bordered;

  const AppSurface({
    super.key,
    required this.child,
    this.padding,
    this.bordered = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: style.colors.surface,
        borderRadius: BorderRadius.circular(style.radius.md),
        border: bordered
            ? Border.all(color: style.colors.border, width: style.borders.thin)
            : null,
      ),
      child: child,
    );
  }
}
