import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/generated/l10n.dart';

class GraduationYearField extends StatelessWidget {
  const GraduationYearField({
    super.key,
    required this.graduationYearController,
  });

  final TextEditingController graduationYearController;

  @override
  Widget build(BuildContext context) {
    return DatePickerField(
      dateController: graduationYearController,
      label: S.of(context).graduationYear,
      hint: S.of(context).graduationYearHint,
      icon: FontAwesomeIcons.graduationCap,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).dateRequired;
        } else if (value.isNotEmpty) {
          if (Jiffy.parse(value, pattern: dateFormat).dateTime ==
              DateTime.now()) {
            return S.of(context).graduationYearIncorrect;
          }
        }
        return null;
      },
    );
  }
}
