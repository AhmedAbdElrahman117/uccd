import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/generated/l10n.dart';

class ClassNumberField extends StatelessWidget {
  const ClassNumberField({
    super.key,
    required this.classController,
  });

  final TextEditingController classController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlphaNumericField(
        controller: classController,
        label: S.of(context).roomNumberLabel,
        hint: S.of(context).roomNumberHint,
        icon: Icons.room,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
