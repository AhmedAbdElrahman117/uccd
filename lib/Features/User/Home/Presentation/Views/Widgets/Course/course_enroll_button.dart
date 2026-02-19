import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_states.dart';
import 'package:uccd/main.dart';

class CourseEnrollButton extends StatelessWidget {
  const CourseEnrollButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: InternalStorage.getString('role') == 'Student',
      child: BlocBuilder<CourseDetailsCubit, CourseDetailsStates>(
        buildWhen: (previous, current) {
          return current is InitialState ||
              current is StatusLoading ||
              current is StatusFailed ||
              current is StatusLoaded;
        },
        builder: (context, state) {
          switch (state) {
            case InitialState():
              return const AdaptiveContainer(
                verticalPadding: 6,
                fixedWidth: double.infinity,
                child: SizedBox(),
              );
            case StatusLoading():
              return AdaptiveContainer(
                verticalPadding: 6,
                fixedWidth: double.infinity,
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: AppColor.primary,
                  size: 40,
                ),
              );
            case StatusFailed():
              return AdaptiveContainer(
                verticalPadding: 14,
                fixedWidth: double.infinity,
                child: Center(
                  child: Text(
                    state.errorMessage,
                    style: AppText.style18Bold(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            case StatusLoaded():
              return SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: state.status,
                  onPressed: state.canEnroll
                      ? () {
                          BlocProvider.of<CourseDetailsCubit>(context)
                              .registerInCourse(
                            courseID: course.courseID!,
                            categoryID: course.categoryID,
                          );
                        }
                      : null,
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  bool checkButtonStatus(CourseDetailsStates state) {
    if (state is StatusLoading || state is StatusFailed) {
      return false;
    } else {
      return true;
    }
  }
}
