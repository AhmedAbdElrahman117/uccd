import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).studentNameLabel,
      hint: S.of(context).studentNameHint,
      icon: Icons.person,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).studentNameRequired;
        }
        return null;
      },
    );
  }
}
