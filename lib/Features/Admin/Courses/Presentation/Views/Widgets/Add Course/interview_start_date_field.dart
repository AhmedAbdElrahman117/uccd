import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';

class InterviewStartDateField extends StatelessWidget {
  const InterviewStartDateField({
    super.key,
    required this.interviewStartController,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewEndController,
  });

  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;

  @override
  Widget build(BuildContext context) {
    return DatePickerField(
      dateController: interviewStartController,
      label: 'Interview Start Date',
      hint: 'Enter Interview Start Date',
      icon: FontAwesomeIcons.clipboardQuestion,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Start Date Required';
        } else if (parseDate(interviewStartController.text)
            .isSameOrAfter(parseDate(interviewEndController.text))) {
          return 'Interview Start Date must be before End Date';
        } else if (parseDate(interviewStartController.text)
                .isSameOrAfter(parseDate(courseStartController.text)) ||
            parseDate(interviewStartController.text)
                .isSameOrAfter(parseDate(courseEndController.text))) {
          return 'Interview Start Date must be Before Courses';
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
