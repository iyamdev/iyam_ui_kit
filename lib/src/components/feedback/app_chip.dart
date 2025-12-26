import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDeleted;

  const AppChip({super.key, required this.label, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Chip(
      label: Text(label),
      deleteIcon: onDeleted != null ? const Icon(Icons.close) : null,
      onDeleted: onDeleted,
      backgroundColor: style.colors.primary.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.radius.sm),
      ),
    );
  }
}
