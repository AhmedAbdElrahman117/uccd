import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class StudentNationalIdField extends StatelessWidget {
  const StudentNationalIdField({
    super.key,
    required this.studentNationalId,
  });

  final TextEditingController studentNationalId;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: studentNationalId,
      label: 'National ID',
      hint: 'Enter Student National ID',
      icon: Icons.person,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'National ID Required';
        } else if (value.length != 14) {
          return 'National ID must be 14 characters length';
        }
        return null;
      },
    );
  }
}
