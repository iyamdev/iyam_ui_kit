import 'package:flutter/material.dart';
import '../../core/tokens/spacing.dart';

class AppCardFooter extends StatelessWidget {
  final Widget child;

  const AppCardFooter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: child,
    );
  }
}
