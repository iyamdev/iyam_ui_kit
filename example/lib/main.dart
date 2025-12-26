import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';
import 'pages/form_demo_page.dart';
import 'pages/button_demo_page.dart';
import 'pages/input_demo_page.dart';
import 'pages/surface_demo_page.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.corporate,
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iyam UI Kit – Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButton.primary(
              label: 'Form Example',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FormDemoPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            AppButton.primary(
              label: 'Button Example',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ButtonDemoPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            AppButton.primary(
              label: 'Input Example',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InputDemoPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            AppButton.primary(
              label: 'Card & Surface Example',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SurfaceDemoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
