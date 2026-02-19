import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';

class CourseStartDateField extends StatelessWidget {
  const CourseStartDateField({
    super.key,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewStartController,
    required this.interviewEndController,
  });

  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;
  @override
  Widget build(BuildContext context) {
    return DatePickerField(
      dateController: courseStartController,
      label: 'Course Start Date',
      hint: 'Enter Course Start Date',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Start Date Required';
        } else if (parseDate(courseStartController.text)
            .isSameOrAfter(parseDate(courseEndController.text))) {
          return 'Course Start Date must be before End Date';
        } else if (parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewEndController.text)) ||
            parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewStartController.text))) {
          return 'Course Start Date must be After Interviews';
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
