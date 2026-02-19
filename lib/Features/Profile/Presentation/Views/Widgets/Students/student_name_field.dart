import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class StudentNameField extends StatelessWidget {
  const StudentNameField({
    super.key,
    required this.studentName,
  });

  final TextEditingController studentName;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: studentName,
      label: 'Student Name',
      hint: 'Enter Student Name',
      icon: Icons.person,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Student Name Required';
        }
        return null;
      },
    );
  }
}
