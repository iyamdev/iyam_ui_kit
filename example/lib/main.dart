import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemePresets.roundedCorporate(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iyam UI Kit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppButton.primary(label: 'Simpan', onPressed: () {}),
            const SizedBox(height: 12),
            AppButton.danger(label: 'Hapus', onPressed: () {}),
            const SizedBox(height: 12),
            AppButton.outline(label: 'Batal', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
