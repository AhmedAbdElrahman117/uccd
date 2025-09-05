import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 50),
      child: CustomPasswordField(
        passwordController: passwordController,
        label: 'Password',
        hint: 'Enter your Password',
      ),
    );
  }
}
