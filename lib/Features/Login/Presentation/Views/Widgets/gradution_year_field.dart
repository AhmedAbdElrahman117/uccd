import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';

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
      label: 'Graduation year',
      hint: 'Enter your Expected Graduation year',
      icon: FontAwesomeIcons.graduationCap,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Date Required';
        } else if (value.isNotEmpty) {
          if (Jiffy.parse(value, pattern: dateFormat).dateTime ==
              DateTime.now()) {
            return 'Graduation year is Incorrect';
          }
        }
        return null;
      },
    );
  }
}
