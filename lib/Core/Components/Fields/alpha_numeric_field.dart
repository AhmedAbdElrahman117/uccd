import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

class AlphaNumericField extends StatelessWidget {
  const AlphaNumericField({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: controller,
      label: label,
      hint: hint,
      icon: icon,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return S.of(context).requiredField;
            }
            return null;
          },
    );
  }
}
