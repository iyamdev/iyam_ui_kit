import 'dart:collection';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/tokens/spacing.dart';
import 'app_toast_variant.dart';
import 'app_toast_position.dart';

class ToastRequest {
  final String message;
  final AppToastVariant variant;
  final Duration duration;
  final AppToastPosition position;
  final String? actionLabel;
  final VoidCallback? onAction;

  ToastRequest({
    required this.message,
    required this.variant,
    required this.duration,
    required this.position,
    this.actionLabel,
    this.onAction,
  });
}

class ToastService {
  static final Queue<ToastRequest> _queue = Queue();
  static bool _isShowing = false;

  static late GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  static void init(GlobalKey<ScaffoldMessengerState> key) {
    scaffoldMessengerKey = key;
  }

  static void show(ToastRequest request) {
    _queue.add(request);
    _tryShowNext();
  }

  static void _tryShowNext() {
    if (_isShowing || _queue.isEmpty) return;

    _isShowing = true;
    final request = _queue.removeFirst();

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: request.duration,
      margin: request.position == AppToastPosition.top
          ? const EdgeInsets.fromLTRB(16, 16, 16, 0)
          : const EdgeInsets.fromLTRB(16, 0, 16, 16),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: _ToastContent(request),
    );

    scaffoldMessengerKey.currentState!.showSnackBar(snackBar).closed.then((_) {
      _isShowing = false;
      _tryShowNext();
    });
  }
}

class _ToastContent extends StatelessWidget {
  final ToastRequest request;

  const _ToastContent(this.request);

  @override
  Widget build(BuildContext context) {
    final style = context.style;

    final bgColor = _background(style);
    final icon = _icon();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(style.radius.md),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              request.message,
              style: style.typography.body.copyWith(color: Colors.white),
            ),
          ),
          if (request.actionLabel != null && request.onAction != null)
            TextButton(
              onPressed: request.onAction,
              child: Text(
                request.actionLabel!,
                style: style.typography.button.copyWith(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Color _background(AppStyle style) {
    switch (request.variant) {
      case AppToastVariant.success:
        return style.colors.success;
      case AppToastVariant.info:
        return style.colors.info;
      case AppToastVariant.warning:
        return style.colors.warning;
      case AppToastVariant.danger:
        return style.colors.error;
    }
  }

  IconData _icon() {
    switch (request.variant) {
      case AppToastVariant.success:
        return Icons.check_circle;
      case AppToastVariant.info:
        return Icons.info;
      case AppToastVariant.warning:
        return Icons.warning;
      case AppToastVariant.danger:
        return Icons.error;
    }
  }
}
