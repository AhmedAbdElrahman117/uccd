import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).nationalIdLabel,
      hint: S.of(context).nationalIdHint,
      icon: Icons.person,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).nationalIdRequired;
        } else if (value.length != 14) {
          return S.of(context).nationalIdLengthError;
        }
        return null;
      },
    );
  }
}
