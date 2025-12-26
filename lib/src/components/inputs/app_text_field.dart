import 'package:flutter/material.dart';
import 'app_input_type.dart';
import 'app_text_form_field.dart';
import 'app_input_variant.dart';
import 'app_input_size.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final AppInputVariant variant;
  final AppInputSize size;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.variant = AppInputVariant.defaultInput,
    this.size = AppInputSize.md,
    this.enabled = true,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: label,
      hint: hint,
      controller: controller,
      enabled: enabled,
      variant: variant,
      size: size,
      prefix: prefix,
      suffix: suffix,
      type: obscureText ? AppInputType.password : AppInputType.text,
    );
  }
}
