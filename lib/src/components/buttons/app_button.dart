import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';
import 'app_button_variant.dart';
import 'app_button_size.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isFullWidth;
  final bool isLoading;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.isFullWidth = false,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
  });

  // ===== FACTORY SHORTCUTS =====

  factory AppButton.primary({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    bool isLoading = false,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? foregroundColor,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.primary,
    size: size,
    isLoading: isLoading,
    borderRadius: borderRadius,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  factory AppButton.danger({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    bool isLoading = false,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? foregroundColor,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.danger,
    size: size,
    isLoading: isLoading,
    borderRadius: borderRadius,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  factory AppButton.outline({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? foregroundColor,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.outline,
    size: size,
    borderRadius: borderRadius,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  factory AppButton.ghost({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? foregroundColor,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.ghost,
    size: size,
    borderRadius: borderRadius,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  // ===== BUILD =====

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    final ButtonStyle resolvedStyle = _resolveStyle(context);

    final Widget content = _buildContent(context);

    final Widget button = IgnorePointer(
      ignoring: isDisabled,
      child: ElevatedButton(
        onPressed: onPressed,
        style: resolvedStyle,
        child: content,
      ),
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  // ===== CONTENT =====

  Widget _buildContent(BuildContext context) {
    final style = context.style;
    final colors = style.colors;
    if (isLoading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: variant.foregroundColor(colors),
        ),
      );
    }

    final List<Widget> children = [];

    if (leadingIcon != null) {
      children.add(leadingIcon!);
      children.add(const SizedBox(width: AppSpacing.sm));
    }

    children.add(Text(label));

    if (trailingIcon != null) {
      children.add(const SizedBox(width: AppSpacing.sm));
      children.add(trailingIcon!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  // ===== STYLE RESOLVER =====

  ButtonStyle _resolveStyle(BuildContext context) {
    final style = context.style;
    final colors = style.colors;

    final EdgeInsets padding = _resolvePadding();
    final OutlinedBorder shape = RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(style.radius.md),
    );

    // If custom colors are provided, use them. Otherwise, use variant colors.
    // Note: for outline/ghost, if backgroundColor is null, it defaults to transparent via variant logic usually,
    // but here we want to allow override.

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? variant.backgroundColor(colors),
          foregroundColor: foregroundColor ?? variant.foregroundColor(colors),
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? variant.backgroundColor(colors),
          foregroundColor: foregroundColor ?? variant.foregroundColor(colors),
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.danger:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? variant.backgroundColor(colors),
          foregroundColor: foregroundColor ?? variant.foregroundColor(colors),
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.outline:
        final fgColor = foregroundColor ?? variant.foregroundColor(colors);
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? variant.backgroundColor(colors),
          foregroundColor: fgColor,
          side: BorderSide(
            color: onPressed != null ? fgColor : colors.disabled,
          ),
          disabledForegroundColor: colors.disabled,
          elevation: 0,
          shape: shape,
        );

      case AppButtonVariant.ghost:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? variant.backgroundColor(colors),
          foregroundColor: foregroundColor ?? variant.foregroundColor(colors),
          disabledForegroundColor: colors.disabled,
          elevation: 0,
          shape: shape,
        );
    }
  }

  // ===== SIZE HANDLER =====

  EdgeInsets _resolvePadding() {
    switch (size) {
      case AppButtonSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
      case AppButtonSize.md:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        );
      case AppButtonSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.lg,
        );
    }
  }
}
