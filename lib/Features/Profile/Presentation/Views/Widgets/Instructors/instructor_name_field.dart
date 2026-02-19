import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class InstructorNameField extends StatelessWidget {
  const InstructorNameField({
    super.key,
    required this.instructorName,
  });

  final TextEditingController instructorName;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: instructorName,
      label: 'Instructor Name',
      hint: 'Enter Instructor Name',
      icon: Icons.person,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name Required';
        }
        return null;
      },
    );
  }
}
