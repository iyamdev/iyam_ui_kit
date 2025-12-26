import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppImagePlaceholder extends StatelessWidget {
  final double? size;

  const AppImagePlaceholder({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return Container(
      width: size,
      height: size,
      color: style.colors.disabled.withValues(alpha: 0.2),
      child: Icon(
        Icons.image_outlined,
        color: style.colors.disabled,
        size: size != null ? size! * 0.4 : 32,
      ),
    );
  }
}
