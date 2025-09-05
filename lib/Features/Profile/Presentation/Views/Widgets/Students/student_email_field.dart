import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class StudentEmailField extends StatelessWidget {
  const StudentEmailField({
    super.key,
    required this.studentName,
    required this.isEditable,
  });

  final TextEditingController studentName;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: studentName,
      label: 'Student Email',
      hint: 'Enter Student Email',
      icon: Icons.email,
      enabled: isEditable,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Student Email Required';
        } else if (!value.endsWith('btu.edu.eg')) {
          return 'University Emails Only';
        }
        return null;
      },
    );
  }
}
