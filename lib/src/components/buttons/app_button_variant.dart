import 'package:flutter/material.dart';

import '../../core/tokens/colors.dart';

enum AppButtonVariant { primary, secondary, danger, outline, ghost }

extension AppButtonVariantExtension on AppButtonVariant {
  Color backgroundColor(AppColors colors) {
    switch (this) {
      case AppButtonVariant.primary:
        return colors.primary;
      case AppButtonVariant.secondary:
        return colors.secondary;
      case AppButtonVariant.danger:
        return colors.error;
      case AppButtonVariant.outline:
        return Colors.transparent;
      case AppButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color foregroundColor(AppColors colors) {
    switch (this) {
      case AppButtonVariant.primary:
        return Colors.white;
      case AppButtonVariant.secondary:
        return Colors.white;
      case AppButtonVariant.danger:
        return Colors.white;
      case AppButtonVariant.outline:
        return colors.primary;
      case AppButtonVariant.ghost:
        return colors.primary;
    }
  }
}
