import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class StudentUniversityIdField extends StatelessWidget {
  const StudentUniversityIdField({
    super.key,
    required this.studentuniversityId,
  });

  final TextEditingController studentuniversityId;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: studentuniversityId,
      label: 'University ID',
      hint: 'Enter Student University ID',
      icon: Icons.person,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'University ID Required';
        } else if (value.length != 9) {
          return 'University ID must be 9 characters length';
        }
        return null;
      },
    );
  }
}
