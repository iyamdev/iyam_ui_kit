import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/tokens/spacing.dart';
import 'app_input_variant.dart';
import 'app_input_size.dart';
import 'app_input_type.dart';
import 'formatters/rupiah_formatter.dart';
import 'formatters/thousand_formatter.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  final AppInputVariant variant;
  final AppInputSize size;
  final AppInputType type;

  final bool enabled;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;

  final int maxLines;

  const AppTextFormField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.variant = AppInputVariant.defaultInput,
    this.size = AppInputSize.md,
    this.type = AppInputType.text,
    this.enabled = true,
    this.readOnly = false,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.style;
    final colors = style.colors;

    final bool isDisabled = !enabled || variant == AppInputVariant.disabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: style.typography.body.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],

        TextFormField(
          controller: controller,
          enabled: !isDisabled,
          readOnly: readOnly,
          obscureText: type == AppInputType.password,
          maxLines: type == AppInputType.password ? 1 : maxLines,
          keyboardType: _keyboardType,
          inputFormatters: _inputFormatters,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          decoration: _decoration(context),
        ),

        if (helperText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            helperText!,
            style: style.typography.caption.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  // ===== DECORATION =====

  InputDecoration _decoration(BuildContext context) {
    final style = context.style;
    final colors = style.colors;

    return InputDecoration(
      hintText: hint,
      prefixIcon: prefix,
      suffixIcon: suffix,
      isDense: true,
      contentPadding: _resolvePadding(),
      enabledBorder: _border(context, colors.border),
      focusedBorder: _border(context, _focusColor(context)),
      errorBorder: _border(context, colors.error),
      focusedErrorBorder: _border(context, colors.error),
      disabledBorder: _border(context, colors.disabled),
    );
  }

  OutlineInputBorder _border(BuildContext context, Color color) {
    final style = context.style;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(style.radius.sm),
      borderSide: BorderSide(color: color, width: style.borders.thin),
    );
  }

  // ===== SIZE =====

  EdgeInsets _resolvePadding() {
    switch (size) {
      case AppInputSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm,
        );
      case AppInputSize.md:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        );
      case AppInputSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        );
    }
  }

  // ===== TYPE HANDLER =====

  TextInputType get _keyboardType {
    switch (type) {
      case AppInputType.number:
      case AppInputType.rupiah:
      case AppInputType.thousand:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? get _inputFormatters {
    switch (type) {
      case AppInputType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case AppInputType.thousand:
        return [ThousandFormatter()];
      case AppInputType.rupiah:
        return [RupiahFormatter()];
      default:
        return null;
    }
  }

  Color _focusColor(BuildContext context) {
    final colors = context.style.colors;

    switch (variant) {
      case AppInputVariant.success:
        return colors.success;
      case AppInputVariant.error:
        return colors.error;
      default:
        return colors.primary;
    }
  }
}
