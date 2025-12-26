import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final Widget field;
  final bool requiredField;

  const AppFormField({
    super.key,
    required this.label,
    required this.field,
    this.hint,
    this.requiredField = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: style.typography.body.copyWith(
                color: style.colors.textPrimary,
              ),
            ),
            if (requiredField)
              Text(
                ' *',
                style: style.typography.body.copyWith(
                  color: style.colors.error,
                ),
              ),
          ],
        ),

        if (hint != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            hint!,
            style: style.typography.caption.copyWith(
              color: style.colors.textSecondary,
            ),
          ),
        ],

        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}
