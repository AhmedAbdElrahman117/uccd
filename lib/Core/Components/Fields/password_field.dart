import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.label,
    required this.hint,
  });

  final TextEditingController passwordController;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CustomPasswordField(
      passwordController: passwordController,
      label: label,
      hint: hint,
    );
  }
}
