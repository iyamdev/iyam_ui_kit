import 'dart:io';

enum AppImageType { asset, network, cachedNetwork, file, svgAsset, svgNetwork }

class AppImageSource {
  final AppImageType type;
  final String? path;
  final File? file;

  const AppImageSource._({required this.type, this.path, this.file});

  // ===== FACTORIES =====

  factory AppImageSource.asset(String path) =>
      AppImageSource._(type: AppImageType.asset, path: path);

  factory AppImageSource.network(String url) =>
      AppImageSource._(type: AppImageType.network, path: url);

  factory AppImageSource.cachedNetwork(String url) =>
      AppImageSource._(type: AppImageType.cachedNetwork, path: url);

  factory AppImageSource.file(File file) =>
      AppImageSource._(type: AppImageType.file, file: file);

  factory AppImageSource.svgAsset(String path) =>
      AppImageSource._(type: AppImageType.svgAsset, path: path);

  factory AppImageSource.svgNetwork(String url) =>
      AppImageSource._(type: AppImageType.svgNetwork, path: url);
}
