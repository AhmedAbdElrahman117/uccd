import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/generated/l10n.dart';

class MaxAcceptedStudentsField extends StatelessWidget {
  const MaxAcceptedStudentsField({
    super.key,
    required this.acceptedStudentsController,
  });

  final TextEditingController acceptedStudentsController;

  @override
  Widget build(BuildContext context) {
    return AlphaNumericField(
      controller: acceptedStudentsController,
      label: S.of(context).maxAcceptedStudents,
      hint: S.of(context).enterMaxAcceptedStudents,
      icon: FontAwesomeIcons.userCheck,
      keyboardType: TextInputType.number,
    );
  }
}
