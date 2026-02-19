import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).instructorEmailLabel,
      hint: S.of(context).instructorEmailHint,
      icon: Icons.email,
      enabled: isEditable,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).emailRequired;
        } else if (!value.endsWith('btu.edu.eg')) {
          return S.of(context).universityEmailsOnly;
        }
        return null;
      },
    );
  }
}
