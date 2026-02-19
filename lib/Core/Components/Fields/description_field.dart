import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final IconData icon;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: controller,
      label: label,
      hint: hint,
      icon: Icons.description,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).requiredField;
        }
        return null;
      },
    );
  }
}
