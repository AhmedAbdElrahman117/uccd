import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/date_picker_field.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).courseEndDateLabel,
      hint: S.of(context).courseEndDateHint,
      icon: FontAwesomeIcons.solidCalendarCheck,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).courseEndDateRequired;
        } else if (parseDate(courseEndController.text)
            .isSameOrBefore(parseDate(courseStartController.text))) {
          return S.of(context).courseEndDateAfterStartDate;
        } else if (parseDate(courseEndController.text)
                .isSameOrBefore(parseDate(interviewEndController.text)) ||
            parseDate(courseStartController.text)
                .isSameOrBefore(parseDate(interviewStartController.text))) {
          return S.of(context).courseEndDateAfterInterviews;
        }
        return null;
      },
    );
  }

  Jiffy parseDate(String text) {
    return Jiffy.parse(text, pattern: dateFormat);
  }
}
