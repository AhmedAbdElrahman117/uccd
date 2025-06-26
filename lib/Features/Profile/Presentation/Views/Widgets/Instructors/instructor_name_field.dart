import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).instructorNameLabel,
      hint: S.of(context).instructorNameHint,
      icon: Icons.person,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).nameRequired;
        }
        return null;
      },
    );
  }
}
