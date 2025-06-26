import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';
import 'package:uccd/generated/l10n.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return CustomPasswordField(
      passwordController: passwordController,
      label: S.of(context).password,
      hint: S.of(context).passwordHint,
    );
  }
}
