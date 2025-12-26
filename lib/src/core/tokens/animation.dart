import 'package:flutter/animation.dart';

class AppAnimation {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);

  static const Curve easeInOut = Curves.easeInOut;
  static const Curve emphasized = Curves.easeOutCubic;
}
