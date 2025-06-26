import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).interviewEndDate,
      hint: S.of(context).enterInterviewEndDate,
      icon: FontAwesomeIcons.clipboardCheck,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).endDateRequired;
        } else if (parseDate(interviewEndController.text)
            .isSameOrBefore(parseDate(interviewStartController.text))) {
          return S.of(context).interviewEndDateAfterStartDate;
        } else if (parseDate(interviewEndController.text)
                .isSameOrAfter(parseDate(courseStartController.text)) ||
            parseDate(interviewEndController.text)
                .isSameOrAfter(parseDate(courseEndController.text))) {
          return S.of(context).interviewEndDateBeforeCourses;
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
