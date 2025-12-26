import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const AppAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    return AppBar(
      title: Text(
        title,
        style: style.typography.title.copyWith(color: style.colors.textPrimary),
      ),
      centerTitle: centerTitle,
      backgroundColor: style.colors.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: style.colors.textPrimary),
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
