import 'package:flutter/material.dart';
import '../theme/theme_extensions.dart';

extension AppThemeContext on BuildContext {
  AppStyle get style => Theme.of(this).extension<AppStyle>()!;
}
