import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return AlertDialog(
      title: Text(title, style: style.typography.title),
      content: content,
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.radius.md),
      ),
    );
  }
}
