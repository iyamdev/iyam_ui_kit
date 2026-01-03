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
        colors: AppColors.base(),
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
        colors: AppColors.base().copyWith(
          primary: const Color(0xFF166534),
          primaryDark: const Color(0xFF14532D),
          primaryLight: const Color(0xFF15803D),
          secondary: const Color(0xFF15803D),
          secondaryDark: const Color(0xFF166534),
          secondaryLight: const Color(0xFF16A34A),
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
