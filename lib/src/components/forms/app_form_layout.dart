import 'package:flutter/material.dart';
import '../../core/tokens/spacing.dart';

class AppFormLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double maxWidth;

  const AppFormLayout({
    super.key,
    required this.child,
    this.padding,
    this.maxWidth = 720,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
      ),
    );
  }
}
