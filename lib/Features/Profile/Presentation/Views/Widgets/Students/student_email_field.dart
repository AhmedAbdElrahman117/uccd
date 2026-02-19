import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).studentEmailLabel,
      hint: S.of(context).studentEmailHint,
      icon: Icons.email,
      enabled: isEditable,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).studentEmailRequired;
        } else if (!value.endsWith('btu.edu.eg')) {
          return S.of(context).universityEmailsOnly;
        }
        return null;
      },
    );
  }
}
