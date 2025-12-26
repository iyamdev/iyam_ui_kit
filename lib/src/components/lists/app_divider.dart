import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Divider(color: style.colors.border, thickness: style.borders.thin);
  }
}
