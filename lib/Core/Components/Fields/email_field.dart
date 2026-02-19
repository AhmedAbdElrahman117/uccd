import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
    required this.label,
    required this.hint,
  });

  final TextEditingController emailController;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: emailController,
      label: label,
      hint: hint,
      icon: Icons.email,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email Required';
        } else if (value.endsWith('@btu.edu.eg')) {
          return 'University Email Only';
        }
        return null;
      },
    );
  }
}
