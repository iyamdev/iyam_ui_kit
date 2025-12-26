import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppFormSection extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;

  const AppFormSection({
    super.key,
    required this.title,
    this.description,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style.typography.title.copyWith(
            color: style.colors.textPrimary,
          ),
        ),

        if (description != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            description!,
            style: style.typography.body.copyWith(
              color: style.colors.textSecondary,
            ),
          ),
        ],

        const SizedBox(height: AppSpacing.md),

        ..._withSpacing(children),

        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  List<Widget> _withSpacing(List<Widget> widgets) {
    final List<Widget> spaced = [];
    for (int i = 0; i < widgets.length; i++) {
      spaced.add(widgets[i]);
      if (i != widgets.length - 1) {
        spaced.add(const SizedBox(height: AppSpacing.md));
      }
    }
    return spaced;
  }
}
