import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_states.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_description_and_learning.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_details.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_info.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_instructor_details.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/course_enroll_button.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/details_app_bar.dart';
import 'package:uccd/main.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({
    super.key,
    required this.tags,
    required this.course,
  });

  static const String id = '/CourseDetailsView';
  final Map<String, String> tags;
  final CourseModel course;

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternalStorage.getString('role') == 'Student'
          ? CourseDetailsCubit(widget.course)
          : CourseDetailsCubit.noStatusCheck(widget.course),
      child: BlocListener<CourseDetailsCubit, CourseDetailsStates>(
        listener: _listener,
        child: Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  DetailsAppBar(
                    imageLink: widget.course.imageLink,
                    tags: widget.tags,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    sliver: SliverList.list(
                      children: [
                        CourseInfo(
                          title: widget.course.title,
                          category: widget.course.category,
                          currentStudents: widget.course.currentStudents,
                          maxAcceptedStudents:
                              widget.course.maxAcceptedStudents,
                          tags: widget.tags,
                        ),
                        const SizedBox(height: 16),
                        CourseDetails(
                          courseEndDate: widget.course.courseEndDate,
                          courseStartDate: widget.course.courseStartDate,
                          duration: widget.course.duration,
                          interviewEndDate: widget.course.interviewEndDate,
                          interviewStartDate: widget.course.interviewStartDate,
                          roomNumber: widget.course.roomNumber,
                          tags: widget.tags,
                        ),
                        const SizedBox(height: 16),
                        CourseInstructorDetails(
                          instructorName: widget.course.instructor,
                        ),
                        const SizedBox(height: 16),
                        CourseDescriptionAndLearning(
                          description: widget.course.description,
                          goals: widget.course.courseGoals,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocSelector<CourseDetailsCubit, CourseDetailsStates, bool>(
                selector: (state) {
                  if (state is RegisterLoading) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return CustomLoadingIndicator(
                    isLoading: state,
                    child: const SizedBox(),
                  );
                },
              )
            ],
          ),
          persistentFooterButtons: [
            CourseEnrollButton(
              course: widget.course,
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, CourseDetailsStates state) {
    if (state is RegisterSuccess) {
      AppBanners.showSuccess(
        message: 'Registered Successfully',
      );
    } else if (state is RegisterFailed) {
      AppBanners.showFailed(
        message: 'Registered Failed',
      );
    }
  }
}
