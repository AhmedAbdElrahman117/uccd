import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: emailController,
      label: 'University Email',
      hint: 'Enter your University Email',
      icon: Icons.email,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email Field is Empty';
        } else if (!value.endsWith('btu.edu.eg')) {
          return 'Only University Emails Allowed';
        } else {
          return null;
        }
      },
    );
  }
}
