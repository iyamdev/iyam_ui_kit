import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/tokens/opacity.dart';
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
  });

  // ===== FACTORY SHORTCUTS =====

  factory AppButton.primary({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    bool isLoading = false,
    BorderRadius? borderRadius,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.primary,
    size: size,
    isLoading: isLoading,
    borderRadius: borderRadius,
  );

  factory AppButton.danger({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    bool isLoading = false,
    BorderRadius? borderRadius,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.danger,
    size: size,
    isLoading: isLoading,
    borderRadius: borderRadius,
  );

  factory AppButton.outline({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    BorderRadius? borderRadius,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.outline,
    size: size,
    borderRadius: borderRadius,
  );

  factory AppButton.ghost({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.md,
    BorderRadius? borderRadius,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.ghost,
    size: size,
    borderRadius: borderRadius,
  );

  // ===== BUILD =====

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    final ButtonStyle resolvedStyle = _resolveStyle(context);

    final Widget content = _buildContent(context, isDisabled: isDisabled);

    final Widget button = ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: resolvedStyle,
      child: content,
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  // ===== CONTENT =====

  Widget _buildContent(BuildContext context, {required bool isDisabled}) {
    if (isLoading) {
      return const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
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

    return Opacity(
      opacity: isDisabled ? AppOpacity.disabled : 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
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

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: colors.secondary,
          foregroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.danger:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: colors.error,
          foregroundColor: Colors.white,
          shape: shape,
        );

      case AppButtonVariant.outline:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          elevation: 0,
          shape: shape,
        );

      case AppButtonVariant.ghost:
        return ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
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
