import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';

class AppSidebar extends StatelessWidget {
  final List<Widget> items;
  final Widget? header;
  final double width;

  const AppSidebar({
    super.key,
    required this.items,
    this.header,
    this.width = 260,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      width: width,
      color: style.colors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) ...[
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: header!,
            ),
          ],
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.sm),
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}
