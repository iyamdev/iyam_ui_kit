import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';

class FormDemoPage extends StatefulWidget {
  const FormDemoPage({super.key});

  @override
  State<FormDemoPage> createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iyam UI Kit – Form Example')),
      body: SingleChildScrollView(
        child: AppFormLayout(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // ===== CARD 1 =====
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppCardHeader(title: 'Data Pribadi'),

                      AppFormSection(
                        title: 'Informasi Umum',
                        description: 'Isi sesuai identitas resmi',
                        children: [
                          AppFormField(
                            label: 'Nama Lengkap',
                            requiredField: true,
                            field: AppTextFormField(
                              hint: 'Nama sesuai KTP',
                              validator: (v) =>
                                  v == null || v.isEmpty ? 'Wajib diisi' : null,
                            ),
                          ),
                          AppFormField(
                            label: 'NIK',
                            field: AppTextFormField(type: AppInputType.number),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ===== CARD 2 =====
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppCardHeader(title: 'Informasi Keuangan'),

                      AppFormSection(
                        title: 'Penghasilan',
                        children: [
                          AppFormField(
                            label: 'Gaji Pokok',
                            field: AppTextFormField(type: AppInputType.rupiah),
                          ),
                          AppFormField(
                            label: 'Tunjangan',
                            field: AppTextFormField(
                              type: AppInputType.thousand,
                              suffix: const Text(' / bulan'),
                            ),
                          ),
                        ],
                      ),

                      AppCardFooter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButton.outline(label: 'Batal', onPressed: () {}),
                            const SizedBox(width: 12),
                            AppButton.primary(
                              label: 'Simpan',
                              onPressed: _submit,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ===== SURFACE =====
                AppSurface(
                  bordered: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Data yang diinput harus valid '
                        'dan dapat dipertanggungjawabkan.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Form berhasil divalidasi')));
    }
  }
}
