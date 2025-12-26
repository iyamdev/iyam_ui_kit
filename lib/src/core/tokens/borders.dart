class AppBorders {
  final double thin;
  final double normal;
  final double thick;

  const AppBorders({
    required this.thin,
    required this.normal,
    required this.thick,
  });

  factory AppBorders.defaultBorder() =>
      const AppBorders(thin: 1, normal: 1.5, thick: 2);
}
