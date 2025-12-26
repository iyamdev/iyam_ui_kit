import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppSidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppSidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(style.radius.sm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: selected
              ? style.colors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(style.radius.sm),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? style.colors.primary
                  : style.colors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              label,
              style: style.typography.body.copyWith(
                color: selected
                    ? style.colors.primary
                    : style.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
