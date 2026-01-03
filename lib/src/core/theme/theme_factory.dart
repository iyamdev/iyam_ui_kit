import 'package:flutter/material.dart';
import 'theme_extensions.dart';
import '../tokens/elevation.dart';

class AppThemeFactory {
  static ThemeData create({
    required Brightness brightness,
    required AppStyle style,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: style.colors.primary,
      primary: style.colors.primary,
      onPrimary: Colors.white,
      primaryContainer: style.colors.primaryLight,
      onPrimaryContainer: Colors.white,
      secondary: style.colors.secondary,
      onSecondary: Colors.white,
      secondaryContainer: style.colors.secondaryLight,
      onSecondaryContainer: Colors.white,
      error: style.colors.error,
      onError: Colors.white,
      surface: style.colors.surface,
      onSurface: style.colors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      primaryColor: style.colors.primary,
      primaryColorDark: style.colors.primaryDark,
      primaryColorLight: style.colors.primaryLight,

      // === GLOBAL FONT ===
      fontFamily: style.typography.fontFamily,

      // === THEME EXTENSION ===
      extensions: [style],

      // === TEXT THEME ===
      textTheme: TextTheme(
        displayLarge: style.typography.display,
        headlineMedium: style.typography.headline,
        titleMedium: style.typography.title,
        bodyMedium: style.typography.body,
        labelLarge: style.typography.button,
        bodySmall: style.typography.caption,
      ),

      // === BUTTON ===
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(style.buttonPadding),
          elevation: WidgetStateProperty.all(AppElevation.md),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(style.radius.button),
            ),
          ),
        ),
      ),

      // === INPUT ===
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: style.inputPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(style.radius.input),
          borderSide: BorderSide(
            color: style.colors.border,
            width: style.borders.thin,
          ),
        ),
      ),

      // === CARD ===
      cardTheme: CardThemeData(
        elevation: AppElevation.sm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(style.radius.card),
        ),
        color: style.colors.surface,
      ),

      // === DIVIDER ===
      dividerTheme: DividerThemeData(
        color: style.colors.border,
        thickness: style.borders.thin,
      ),
    );
  }
}
