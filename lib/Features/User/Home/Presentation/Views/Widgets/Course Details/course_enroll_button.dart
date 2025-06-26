import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_states.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class CourseEnrollButton extends StatelessWidget {
  const CourseEnrollButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsCubit, CourseDetailsStates>(
      builder: (context, state) {
        // Determine button properties based on cubit state
        String buttonText = S.of(context).enrollNowButton;
        bool isEnabled = false;
        Color startColor = Colors.grey.shade600;
        Color endColor = Colors.grey.shade700;
        IconData buttonIcon = Icons.access_time;
        if (state is StatusLoaded) {
          // Map status keys to localized text
          switch (state.status) {
            case 'enrollNow':
              buttonText = S.of(context).enrollNow;
              break;
            case 'enrolledInThisCategory':
              buttonText = S.of(context).enrolledInThisCategory;
              break;
            case 'courseFull':
              buttonText = S.of(context).courseFull;
              break;
            default:
              buttonText = state.status; // Fallback to raw status
          }
          isEnabled = state.canEnroll;
          if (state.canEnroll) {
            startColor = AppColor.primary;
            endColor = AppColor.primary.withBlue(255);
            buttonIcon = Icons.how_to_reg;
          }
        }

        // Calculate text width for adaptive button width
        double textWidth = getTextWidth(
          buttonText,
          AppText.style16Bold(context).copyWith(color: Colors.white),
        );

        return Visibility(
          visible: InternalStorage.getString('role') == 'Student',
          child: Container(
            // Using adaptive width based on content with min width and horizontal padding
            width: textWidth +
                80, // Add some padding to accommodate the text and icon
            height: 65, // Increased height to accommodate the progress bar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: (isEnabled ? AppColor.primary : Colors.grey)
                      .withValues(alpha: 0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [startColor, endColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isEnabled ? () => _handleEnrollment(context) : null,
                borderRadius: BorderRadius.circular(28),
                splashColor: Colors.white.withValues(alpha: 0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state is StatusLoading
                          ? getSubLoading(size: 40)
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Icon(
                                  buttonIcon,
                                  color: Colors.white,
                                ),
                                Text(
                                  buttonText,
                                  style: AppText.style16Bold(context).copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Handle the enrollment action
  void _handleEnrollment(BuildContext context) {
    // Store a reference to the cubit outside the dialog to avoid context issues
    final courseDetailsCubit = context.read<CourseDetailsCubit>();

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (dialogContext) {
        // Using a different context name to avoid confusion
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(S.of(context).confirmEnrollmentTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).confirmEnrollmentMessage(course.title)),
              const SizedBox(height: 12),
              Text(
                S.of(context).interviewPeriodLabel(
                      AppDates.timeStampToString(course.interviewStartDate),
                      AppDates.timeStampToString(course.interviewEndDate),
                    ),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).coursePeriodLabel(
                      AppDates.timeStampToString(course.courseStartDate),
                      AppDates.timeStampToString(course.courseEndDate),
                    ),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () {
                // Use the stored cubit reference instead of trying to access it from the dialog context
                courseDetailsCubit.registerInCourse(
                  courseID: course.courseID!,
                  categoryID: course.categoryID,
                );
                Navigator.of(dialogContext).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(S.of(context).confirmButton),
            ),
          ],
        );
      },
    );
  }
}

// Helper method for text width calculation
double getTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);

  return textPainter.size.width;
}
