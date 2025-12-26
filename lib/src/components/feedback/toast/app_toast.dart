import 'package:flutter/material.dart';

import 'toast_service.dart';
import 'app_toast_variant.dart';
import 'app_toast_position.dart';

class AppToast {
  // ===== SHORTCUTS =====

  static void success(
    String message, {
    AppToastPosition position = AppToastPosition.bottom,
  }) {
    _enqueue(message, AppToastVariant.success, position);
  }

  static void info(
    String message, {
    AppToastPosition position = AppToastPosition.bottom,
  }) {
    _enqueue(message, AppToastVariant.info, position);
  }

  static void warning(
    String message, {
    AppToastPosition position = AppToastPosition.bottom,
  }) {
    _enqueue(message, AppToastVariant.warning, position);
  }

  static void error(
    String message, {
    AppToastPosition position = AppToastPosition.bottom,
  }) {
    _enqueue(message, AppToastVariant.danger, position);
  }

  static void show({
    required String message,
    required AppToastVariant variant,
    AppToastPosition position = AppToastPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    ToastService.show(
      ToastRequest(
        message: message,
        variant: variant,
        duration: duration,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
      ),
    );
  }

  static void _enqueue(
    String message,
    AppToastVariant variant,
    AppToastPosition position,
  ) {
    show(message: message, variant: variant, position: position);
  }
}
