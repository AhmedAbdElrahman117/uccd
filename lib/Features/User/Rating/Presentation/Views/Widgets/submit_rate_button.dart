import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views%20Model/rate_course_cubit.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';
import 'package:uccd/main.dart';

class SubmitRateButton extends StatelessWidget {
  const SubmitRateButton({
    super.key,
    required this.overallRate,
    required this.contentRate,
    required this.instructorRate,
    required this.commentController,
    required this.course,
  });

  final double overallRate;
  final double contentRate;
  final double instructorRate;
  final TextEditingController commentController;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final bool canSubmit = _canSubmit();

    return SafeArea(
      bottom: true,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: canSubmit ? AppColor.primary : Colors.grey,
          boxShadow: canSubmit
              ? [
                  BoxShadow(
                    color:
                        UserThemeHelper.getPrimaryStatColor(context).withValues(
                      alpha: 0.3,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: ElevatedButton(
          onPressed: canSubmit
              ? () {
                  final rating = RatingModel(
                    courseId: course.courseID!,
                    userId: InternalStorage.getString('id'),
                    userName: InternalStorage.getString('name'),
                    overallRating: overallRate,
                    contentRating: contentRate,
                    instructorRating: instructorRate,
                    comment: commentController.text,
                  );

                  context.read<RateCourseCubit>().submitRating(rating);
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
              Text(
                'Submit Rating',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _canSubmit() {
    return overallRate > 0 && contentRate > 0 && instructorRate > 0;
  }
}
