import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_end_date_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_start_date_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/interview_end_date_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/interview_start_date_field.dart';
import 'package:uccd/generated/l10n.dart';

class CourseDatesPage extends StatefulWidget {
  const CourseDatesPage({
    super.key,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewStartController,
    required this.interviewEndController,
    required this.datesKey,
  });

  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;
  final GlobalKey<FormState> datesKey;

  @override
  State<CourseDatesPage> createState() => _CourseDatesPageState();
}

class _CourseDatesPageState extends State<CourseDatesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.datesKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                Text(
                  S.of(context).courseDates,
                  style: AppText.style18Bold(context),
                ),
                Text(
                  S.of(context).courseDatesDescription,
                  style: AppText.style16Regular(context),
                ),
                CourseStartDateField(
                  courseStartController: widget.courseStartController,
                  courseEndController: widget.courseEndController,
                  interviewEndController: widget.interviewEndController,
                  interviewStartController: widget.interviewStartController,
                ),
                CourseEndDateField(
                  courseStartController: widget.courseStartController,
                  courseEndController: widget.courseEndController,
                  interviewEndController: widget.interviewEndController,
                  interviewStartController: widget.interviewStartController,
                ),
                InterviewStartDateField(
                  courseStartController: widget.courseStartController,
                  courseEndController: widget.courseEndController,
                  interviewEndController: widget.interviewEndController,
                  interviewStartController: widget.interviewStartController,
                ),
                InterviewEndDateField(
                  courseStartController: widget.courseStartController,
                  courseEndController: widget.courseEndController,
                  interviewEndController: widget.interviewEndController,
                  interviewStartController: widget.interviewStartController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
