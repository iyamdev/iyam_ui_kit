import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';

class SurfaceDemoPage extends StatelessWidget {
  const SurfaceDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card & Surface Components')),
      body: SingleChildScrollView(
        child: AppFormLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== BASIC CARD =====
              const _SectionTitle('Basic Card'),
              AppCard(
                child: const Text(
                  'Ini adalah AppCard dasar '
                  'untuk menampung konten.',
                ),
              ),

              _space(),

              // ===== CARD WITH HEADER & FOOTER =====
              const _SectionTitle('Card with Header & Footer'),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppCardHeader(title: 'Informasi Akun'),
                    const Text(
                      'Data akun digunakan untuk '
                      'keperluan autentikasi.',
                    ),
                    AppCardFooter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButton.outline(label: 'Batal', onPressed: () {}),
                          const SizedBox(width: 12),
                          AppButton.primary(label: 'Simpan', onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              _space(),

              // ===== SURFACE =====
              const _SectionTitle('Surface'),
              AppSurface(
                bordered: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Surface digunakan sebagai '
                      'background section.',
                    ),
                    SizedBox(height: 8),
                    Text('Biasanya tanpa elevation.'),
                  ],
                ),
              ),

              _space(),

              // ===== INTERACTIVE CARD =====
              const _SectionTitle('Interactive Card'),
              AppCard(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Card ditekan')));
                },
                child: const Text('Card ini bisa ditekan.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _space() => const SizedBox(height: 24);
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
