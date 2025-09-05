import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class InstructorEmailField extends StatelessWidget {
  const InstructorEmailField({
    super.key,
    required this.instructorEmail,
    required this.isEditable,
  });

  final TextEditingController instructorEmail;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: instructorEmail,
      label: 'Instructor Email',
      hint: 'Enter Instructor Email',
      icon: Icons.email,
      enabled: isEditable,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email Required';
        } else if (!value.endsWith('btu.edu.eg')) {
          return 'University Emails Only';
        }
        return null;
      },
    );
  }
}
