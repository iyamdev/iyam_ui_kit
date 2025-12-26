import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppCardHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const AppCardHeader({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: style.typography.title.copyWith(
                color: style.colors.textPrimary,
              ),
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}
