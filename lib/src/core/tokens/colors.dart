import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color secondary;
  final Color secondaryDark;
  final Color secondaryLight;
  final Color accent;

  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color background;
  final Color surface;
  final Color border;
  final Color disabled;

  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  const AppColors({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.secondary,
    required this.secondaryDark,
    required this.secondaryLight,
    required this.accent,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.background,
    required this.surface,
    required this.border,
    required this.disabled,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
  });

  AppColors copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? secondary,
    Color? secondaryDark,
    Color? secondaryLight,
    Color? accent,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? background,
    Color? surface,
    Color? border,
    Color? disabled,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
    );
  }

  factory AppColors.base() => const AppColors(
    primary: Color(0xFF2563EB),
    primaryDark: Color(0xFF1D4ED8),
    primaryLight: Color(0xFF3B82F6),
    secondary: Color(0xFF4F46E5),
    secondaryDark: Color(0xFF4338CA),
    secondaryLight: Color(0xFF6366F1),
    accent: Color(0xFF06B6D4),
    success: Color(0xFF22C55E),
    warning: Color(0xFFFACC15),
    error: Color(0xFFEF4444),
    info: Color(0xFF0EA5E9),
    background: Color(0xFFF8FAFC),
    surface: Color(0xFFFFFFFF),
    border: Color(0xFFE2E8F0),
    disabled: Color(0xFFCBD5E1),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF475569),
    textDisabled: Color(0xFF94A3B8),
  );
}
