import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_password_field.dart';

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
      label: 'Instructor Password',
      hint: 'Enter Instructor Password',
    );
  }
}
