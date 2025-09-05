import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';

class CourseEndDateField extends StatelessWidget {
  const CourseEndDateField({
    super.key,
    required this.courseEndController,
    required this.courseStartController,
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
      dateController: courseEndController,
      label: 'Course End Date',
      hint: 'Enter Course End Date',
      icon: FontAwesomeIcons.solidCalendarCheck,
      validator: (value) {
        if (value!.isEmpty) {
          return 'End Date Required';
        } else if (parseDate(courseEndController.text)
            .isSameOrBefore(parseDate(courseStartController.text))) {
          return 'Course End Date must be After Start Date';
        } else if (parseDate(courseEndController.text)
                .isSameOrBefore(parseDate(interviewEndController.text)) ||
            parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewStartController.text))) {
          return 'Course End Date must be After Interviews';
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
