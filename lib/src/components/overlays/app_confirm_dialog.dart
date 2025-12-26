import 'package:flutter/material.dart';

import '../buttons/app_button.dart';
import 'app_dialog.dart';

class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      content: Text(message),
      actions: [
        AppButton.outline(
          label: 'Batal',
          onPressed: () => Navigator.pop(context),
        ),
        AppButton.danger(
          label: 'Ya',
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    );
  }
}
