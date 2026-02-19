import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_states.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_category.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_description.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_enroll_button.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_enrollments.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_instrcutor.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_prerequisites.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_related.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_schedule.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_stats.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_timeline.dart';
import 'package:uccd/generated/l10n.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({
    super.key,
    required this.tags,
    required this.course,
    this.hideEnrollButton = false,
  });

  static const String id = '/CourseDetailsView';
  final CourseModel course;
  final Map<String, String> tags;
  final bool hideEnrollButton;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1A) : Colors.white;

    return BlocProvider(
      create: (context) => CourseDetailsCubit(course),
      child: BlocListener<CourseDetailsCubit, CourseDetailsStates>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            foregroundColor: AppColor.primary,
            centerTitle: true,
            title: SectionTitle(title: course.title),
          ),
          body: Stack(
            children: [
              Container(
                color: backgroundColor,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    100,
                  ),
                  children: [
                    CachedImage(
                      imageUrl: course.imageLink,
                      fallbackImage: AppAssets.imagesUCCDLOGO,
                      topRadius: 16,
                      bottomRadius: 16,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            course.title,
                            style: AppText.style23Bold(context).copyWith(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        CourseCategory(
                          category: course.category,
                        ),
                      ],
                    ),

                    // Category and enrollment stats
                    CourseEnrollments(
                      currentStudents: course.currentStudents,
                      maxAcceptedStudents: course.maxAcceptedStudents,
                    ),

                    // Course quick stats
                    CourseStats(
                      course: course,
                    ),

                    const SizedBox(height: 20),

                    // Instructor information with avatar
                    CourseInstrcutor(
                      isDarkMode: isDarkMode,
                      course: course,
                    ),

                    const SizedBox(height: 16), // Course schedule
                    CourseSchedule(
                      isDarkMode: isDarkMode,
                      courseStartDate: course.courseStartDate,
                      courseEndDate: course.courseEndDate,
                      interviewStartDate: course.interviewStartDate,
                      interviewEndDate: course.interviewEndDate,
                      roomNumber: course.roomNumber,
                      duration: course.duration,
                      tags: tags,
                    ),

                    const SizedBox(height: 20), // Prerequisites/Skills
                    CoursePrerequisites(
                      prerequisites: course.coursePrerequests ?? [],
                    ),

                    const SizedBox(
                      height: 20,
                    ), // Course description and learning goals
                    CourseDescription(
                      isDarkMode: isDarkMode,
                      description: course.description,
                      goals:
                          course.courseGoals ?? [S.of(context).noGoalsProvided],
                    ),

                    const SizedBox(height: 20),

                    // Course timeline
                    CourseTimeline(
                      isDarkMode: isDarkMode,
                      courseStartDate: course.courseStartDate,
                      courseEndDate: course.courseEndDate,
                      interviewStartDate: course.interviewStartDate,
                      interviewEndDate: course.interviewEndDate,
                      course: course,
                    ),

                    const SizedBox(height: 20), // Related courses (hidden)
                    Visibility(
                      visible: false,
                      child: CourseRelated(
                        relatedCourses: [
                          {
                            'title':
                                S.of(context).advancedCourse(course.category),
                            'rating': 4.8,
                            'instructor': 'Dr. Smith',
                          },
                          {
                            'title':
                                S.of(context).beginnerCourse(course.category),
                            'rating': 4.2,
                            'instructor': 'Prof. Johnson',
                          },
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlocSelector<CourseDetailsCubit, CourseDetailsStates, bool>(
                selector: (state) => state is RegisterLoading,
                builder: (context, state) => CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(),
                ),
              ),
            ],
          ),
          floatingActionButton: hideEnrollButton
              ? null
              : CourseEnrollButton(
                  course: course,
                ),
          floatingActionButtonLocation: hideEnrollButton
              ? null
              : FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  void _listener(BuildContext context, CourseDetailsStates state) {
    if (state is RegisterSuccess) {
      AppBanners.showSuccess(
        message: S.of(context).enrollmentSuccess(course.title),
      );
    } else if (state is RegisterFailed) {
      AppBanners.showFailed(
        message: S.of(context).enrollmentError(state.errorMessage),
      );
    }
  }
}
