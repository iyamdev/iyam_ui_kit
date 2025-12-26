class AppRadius {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const AppRadius({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory AppRadius.rounded() =>
      const AppRadius(xs: 4, sm: 8, md: 16, lg: 24, xl: 32);

  factory AppRadius.square() =>
      const AppRadius(xs: 0, sm: 0, md: 0, lg: 0, xl: 0);
}
