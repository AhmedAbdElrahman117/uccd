import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).courseStartDateLabel,
      hint: S.of(context).courseStartDateHint,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).courseStartDateRequired;
        } else if (parseDate(courseStartController.text)
            .isSameOrAfter(parseDate(courseEndController.text))) {
          return S.of(context).courseStartDateBeforeEndDate;
        } else if (parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewEndController.text)) ||
            parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewStartController.text))) {
          return S.of(context).courseStartDateAfterInterviews;
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
