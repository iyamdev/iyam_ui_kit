import 'package:flutter/material.dart';
import 'theme_factory.dart';
import 'theme_extensions.dart';
import '../tokens/colors.dart';
import '../tokens/radius.dart';
import '../tokens/typography.dart';
import '../tokens/borders.dart';

class ThemePresets {
  /// 🔵 Rounded Corporate
  static ThemeData roundedCorporate() {
    return AppThemeFactory.create(
      brightness: Brightness.light,
      style: AppStyle(
        colors: AppColors.corporate(),
        radius: AppRadius.rounded(),
        typography: AppTypography.defaultFont(),
        borders: AppBorders.defaultBorder(),
        buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        inputPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  /// 🟩 Square Government
  static ThemeData squareGovernment() {
    return AppThemeFactory.create(
      brightness: Brightness.light,
      style: AppStyle(
        colors: AppColors.corporate().copyWith(
          primary: const Color(0xFF166534),
          secondary: const Color(0xFF15803D),
        ),
        radius: AppRadius.square(),
        typography: AppTypography.defaultFont(),
        borders: AppBorders.defaultBorder(),
        buttonPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        inputPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
