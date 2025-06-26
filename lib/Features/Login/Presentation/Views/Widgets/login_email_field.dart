import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).universityEmail,
      hint: S.of(context).universityEmailHint,
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).emailRequired;
        }

        // Basic email format validation
        if (!value.contains('@')) {
          return S.of(context).invalidEmail;
        }

        // University email validation
        if (!value.endsWith('@btu.edu.eg')) {
          return S.of(context).onlyBtuEmail;
        }

        // Check for valid username part
        final emailParts = value.split('@');
        if (emailParts[0].length < 3) {
          return S.of(context).emailUsernameTooShort;
        }

        return null;
      },
    );
  }
}
