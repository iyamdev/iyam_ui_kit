import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;

  const AppSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Text(title, style: style.typography.title),
    );
  }
}
