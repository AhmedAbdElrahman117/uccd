import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_cubit.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/course_progress_card.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/section_header.dart';
import 'package:uccd/generated/l10n.dart';

class ProgressCourses extends StatelessWidget {
  const ProgressCourses({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: S.of(context).inProgress,
            onViewAllPressed: () {
              tabController.animateTo(2);
            },
          ),
          BlocBuilder<MyCoursesCubit, MyCoursesStates>(
            builder: (context, state) {
              switch (state) {
                case InitialState():
                  return const SizedBox();
                case DataLoading():
                  return Center(
                    child: mainLoading,
                  );
                case DataEmpty():
                  return NoDataWidget(
                    message: S.of(context).noCoursesInProgress,
                    showImage: false,
                  );
                case DataFailed():
                  return DataErrorWidget(
                    message:
                        '${S.of(context).failedToLoadCourses}: ${state.errorMessage}',
                  );
                case DataLoaded():
                  return Column(
                    children: state.data.indexed.map(
                      (course) {
                        return CourseProgressCard(
                          title: state.data[course.$1].course.title,
                          instructor: state.data[course.$1].course.instructor,
                          progress: state.data[course.$1].progress,
                          progressText: state.data[course.$1].progressText,
                          course: state
                              .data[course.$1].course, // Pass the course object
                          onTap: () =>
                              CourseDetailsNavigator.navigateToCourseDetails(
                            context,
                            state.data[course.$1].course,
                          ),
                        );
                      },
                    ).toList(),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
