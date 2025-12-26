import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: style.colors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(style.radius.lg),
        ),
      ),
      child: child,
    );
  }
}
