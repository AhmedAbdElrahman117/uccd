import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorPasswordField extends StatelessWidget {
  const InstructorPasswordField({
    super.key,
    required this.instructorPassword,
  });

  final TextEditingController instructorPassword;

  @override
  Widget build(BuildContext context) {
    return CustomPasswordField(
      passwordController: instructorPassword,
      label: S.of(context).instructorPasswordLabel,
      hint: S.of(context).instructorPasswordHint,
    );
  }
}
