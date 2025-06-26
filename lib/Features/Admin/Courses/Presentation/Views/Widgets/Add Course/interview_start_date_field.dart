import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).interviewStartDate,
      hint: S.of(context).enterInterviewStartDate,
      icon: FontAwesomeIcons.clipboardQuestion,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).startDateRequired;
        } else if (parseDate(interviewStartController.text)
            .isSameOrAfter(parseDate(interviewEndController.text))) {
          return S.of(context).interviewStartDateBeforeEndDate;
        } else if (parseDate(interviewStartController.text)
                .isSameOrAfter(parseDate(courseStartController.text)) ||
            parseDate(interviewStartController.text)
                .isSameOrAfter(parseDate(courseEndController.text))) {
          return S.of(context).interviewStartDateBeforeCourses;
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
