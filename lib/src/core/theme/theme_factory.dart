import 'package:flutter/material.dart';
import 'theme_extensions.dart';
import '../tokens/elevation.dart';

class AppThemeFactory {
  static ThemeData create({
    required Brightness brightness,
    required AppStyle style,
  }) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: style.colors.primary,
      onPrimary: Colors.white,
      secondary: style.colors.secondary,
      onSecondary: Colors.white,
      error: style.colors.error,
      onError: Colors.white,
      background: style.colors.background,
      onBackground: style.colors.textPrimary,
      surface: style.colors.surface,
      onSurface: style.colors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,

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
              borderRadius: BorderRadius.circular(style.radius.md),
            ),
          ),
        ),
      ),

      // === INPUT ===
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: style.inputPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(style.radius.sm),
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
          borderRadius: BorderRadius.circular(style.radius.md),
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
