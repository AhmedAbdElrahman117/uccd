import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';

class InterviewEndDateField extends StatelessWidget {
  const InterviewEndDateField({
    super.key,
    required this.interviewEndController,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewStartController,
  });

  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;

  @override
  Widget build(BuildContext context) {
    return DatePickerField(
      dateController: interviewEndController,
      label: 'Interview End Date',
      hint: 'Enter Interview End Date',
      icon: FontAwesomeIcons.clipboardCheck,
      validator: (value) {
        if (value!.isEmpty) {
          return 'End Date Required';
        } else if (parseDate(interviewEndController.text)
            .isSameOrBefore(parseDate(interviewStartController.text))) {
          return 'Interview End Date must be After Start Date';
        } else if (parseDate(interviewEndController.text)
                .isSameOrAfter(parseDate(courseStartController.text)) ||
            parseDate(interviewEndController.text)
                .isSameOrAfter(parseDate(courseEndController.text))) {
          return 'Interview End Date must be Before Courses';
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
