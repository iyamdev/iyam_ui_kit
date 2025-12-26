import 'package:flutter/material.dart';
import '../app_text_form_field.dart';

class AppSelectField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<AppSelectItem<T>> items;
  final ValueChanged<T> onChanged;

  const AppSelectField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: label,
      readOnly: true,
      controller: TextEditingController(
        text: items
            .firstWhere(
              (e) => e.value == value,
              orElse: () => const AppSelectItem(label: '', value: null),
            )
            .label,
      ),
      suffix: const Icon(Icons.arrow_drop_down),
      onTap: () => _showBottomSheet(context),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        children: items
            .map(
              (e) => ListTile(
                title: Text(e.label),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(e.value as T);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class AppSelectItem<T> {
  final String label;
  final T? value;

  const AppSelectItem({required this.label, required this.value});
}
