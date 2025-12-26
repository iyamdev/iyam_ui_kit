import 'package:flutter/material.dart';
import '../app_text_form_field.dart';

class AppDatePickerField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;

  const AppDatePickerField({
    super.key,
    required this.label,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: label,
      controller: TextEditingController(
        text: value != null ? _formatDate(value!) : '',
      ),
      suffix: const Icon(Icons.calendar_today),
      enabled: false,
      onTap: () async {
        final DateTime? result = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (result != null) {
          onChanged(result);
        }
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
