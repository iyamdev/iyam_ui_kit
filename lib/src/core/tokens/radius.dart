class AppRadius {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double input;
  final double button;
  final double card;

  const AppRadius({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.input,
    required this.button,
    required this.card,
  });

  factory AppRadius.rounded() => const AppRadius(
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
    input: 8,
    button: 48,
    card: 16,
  );

  factory AppRadius.square() => const AppRadius(
    xs: 0,
    sm: 0,
    md: 0,
    lg: 0,
    xl: 0,
    input: 0,
    button: 0,
    card: 0,
  );
}
