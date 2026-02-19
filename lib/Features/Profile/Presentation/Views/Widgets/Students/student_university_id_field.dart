import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).universityIdLabel,
      hint: S.of(context).universityIdHint,
      icon: Icons.person,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).universityIdRequired;
        } else if (value.length != 9) {
          return S.of(context).universityIdLengthError;
        }
        return null;
      },
    );
  }
}
