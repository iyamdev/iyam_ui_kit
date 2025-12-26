import 'package:flutter/material.dart';

class AppTypography {
  final String fontFamily;

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle button;

  const AppTypography({
    required this.fontFamily,
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.caption,
    required this.button,
  });

  factory AppTypography.defaultFont() => const AppTypography(
    fontFamily: 'Inter',
    display: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headline: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    title: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    body: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    caption: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    button: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
  );
}
