import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radius.dart';
import '../tokens/typography.dart';
import '../tokens/borders.dart';

@immutable
class AppStyle extends ThemeExtension<AppStyle> {
  final AppColors colors;
  final AppRadius radius;
  final AppTypography typography;
  final AppBorders borders;

  final EdgeInsets buttonPadding;
  final EdgeInsets inputPadding;

  const AppStyle({
    required this.colors,
    required this.radius,
    required this.typography,
    required this.borders,
    required this.buttonPadding,
    required this.inputPadding,
  });

  @override
  AppStyle copyWith({
    AppColors? colors,
    AppRadius? radius,
    AppTypography? typography,
    AppBorders? borders,
    EdgeInsets? buttonPadding,
    EdgeInsets? inputPadding,
  }) {
    return AppStyle(
      colors: colors ?? this.colors,
      radius: radius ?? this.radius,
      typography: typography ?? this.typography,
      borders: borders ?? this.borders,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      inputPadding: inputPadding ?? this.inputPadding,
    );
  }

  @override
  AppStyle lerp(ThemeExtension<AppStyle>? other, double t) {
    return this;
  }
}
