import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';
import 'package:uccd/generated/l10n.dart';

class StudentPasswordField extends StatelessWidget {
  const StudentPasswordField({
    super.key,
    required this.studentPassword,
  });

  final TextEditingController studentPassword;

  @override
  Widget build(BuildContext context) {
    return CustomPasswordField(
      passwordController: studentPassword,
      label: S.of(context).studentPasswordLabel,
      hint: S.of(context).studentPasswordHint,
    );
  }
}
