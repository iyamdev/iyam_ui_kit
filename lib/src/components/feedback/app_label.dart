import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppLabel extends StatelessWidget {
  final String text;

  const AppLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Text(
      text,
      style: style.typography.caption.copyWith(
        color: style.colors.textSecondary,
      ),
    );
  }
}
