import 'package:flutter/material.dart';
import '../app_image.dart';
import '../app_image_source.dart';

class AppImageGrid extends StatelessWidget {
  final List<AppImageSource> images;
  final int crossAxisCount;
  final double spacing;

  const AppImageGrid({
    super.key,
    required this.images,
    this.crossAxisCount = 3,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: images.length,
      itemBuilder: (_, index) {
        return AppImage(source: images[index]);
      },
    );
  }
}
