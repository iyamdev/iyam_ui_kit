import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Components')),
      body: SingleChildScrollView(
        child: AppFormLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== VARIANTS =====
              const Text(
                'Variants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AppButton.primary(label: 'Primary', onPressed: () {}),
                  AppButton(
                    label: 'Secondary',
                    variant: AppButtonVariant.secondary,
                    onPressed: () {},
                  ),
                  AppButton.danger(label: 'Danger', onPressed: () {}),
                  AppButton.outline(label: 'Outline', onPressed: () {}),
                  AppButton.ghost(label: 'Ghost', onPressed: () {}),
                ],
              ),

              const SizedBox(height: 32),

              // ===== SIZES =====
              const Text(
                'Sizes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AppButton.primary(
                    label: 'Small',
                    size: AppButtonSize.sm,
                    onPressed: () {},
                  ),
                  AppButton.primary(
                    label: 'Medium',
                    size: AppButtonSize.md,
                    onPressed: () {},
                  ),
                  AppButton.primary(
                    label: 'Large',
                    size: AppButtonSize.lg,
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // ===== STATES =====
              const Text(
                'States',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AppButton.primary(
                    label: 'Loading',
                    isLoading: true,
                    onPressed: () {},
                  ),
                  AppButton.primary(label: 'Disabled', onPressed: null),
                ],
              ),

              const SizedBox(height: 32),

              // ===== ICON BUTTON =====
              const Text(
                'With Icon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AppButton.primary(label: 'Login', onPressed: () {}),
                  AppButton.outline(label: 'Download', onPressed: () {}),
                ],
              ),

              const SizedBox(height: 32),

              // ===== FULL WIDTH =====
              const Text(
                'Full Width',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              AppButton.primary(label: 'Submit', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
