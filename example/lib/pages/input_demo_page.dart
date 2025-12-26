import 'package:flutter/material.dart';
import 'package:iyam_ui_kit/iyam_ui_kit.dart';

class InputDemoPage extends StatefulWidget {
  const InputDemoPage({super.key});

  @override
  State<InputDemoPage> createState() => _InputDemoPageState();
}

class _InputDemoPageState extends State<InputDemoPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Components')),
      body: SingleChildScrollView(
        child: AppFormLayout(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== BASIC INPUT =====
                const _SectionTitle('Basic Inputs'),
                AppTextFormField(label: 'Text', hint: 'Input text biasa'),
                _space(),

                AppTextFormField(
                  label: 'Password',
                  type: AppInputType.password,
                ),
                _space(),

                AppTextFormField(label: 'Number', type: AppInputType.number),

                _sectionSpace(),

                // ===== FORMATTED INPUT =====
                const _SectionTitle('Formatted Inputs'),
                AppTextFormField(
                  label: 'Thousand Separator',
                  type: AppInputType.thousand,
                ),
                _space(),

                AppTextFormField(label: 'Rupiah', type: AppInputType.rupiah),

                _sectionSpace(),

                // ===== PREFIX & SUFFIX =====
                const _SectionTitle('Prefix & Suffix'),
                AppTextFormField(
                  label: 'Website',
                  prefix: const Icon(Icons.link),
                  hint: 'https://',
                ),
                _space(),

                AppTextFormField(label: 'Berat', suffix: const Text('kg')),

                _sectionSpace(),

                // ===== VARIANT =====
                const _SectionTitle('Variants'),
                AppTextFormField(
                  label: 'Success',
                  variant: AppInputVariant.success,
                  helperText: 'Input valid',
                ),
                _space(),

                AppTextFormField(
                  label: 'Error',
                  variant: AppInputVariant.error,
                  validator: (_) => 'Terjadi kesalahan',
                ),
                _space(),

                AppTextFormField(label: 'Disabled', enabled: false),

                _sectionSpace(),

                AppButton.primary(
                  label: 'Validate Form',
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _space() => const SizedBox(height: 16);
  Widget _sectionSpace() => const SizedBox(height: 32);
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
