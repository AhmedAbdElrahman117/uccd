import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_cubit.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';
import 'package:uccd/Features/User/user_view_test_widgets/my_courses_tab/enrolled_course_card.dart';
import 'package:uccd/Features/User/user_view_test_widgets/my_courses_tab/my_courses_empty_state.dart';
import 'package:uccd/Features/User/user_view_test_widgets/my_courses_tab/my_courses_header.dart';

class MyCoursesTab extends StatefulWidget {
  const MyCoursesTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<MyCoursesTab> createState() => _MyCoursesTabState();
}

class _MyCoursesTabState extends State<MyCoursesTab>
    with AutomaticKeepAliveClientMixin<MyCoursesTab> {
  late MyCoursesCubit _myCoursesCubit;

  @override
  void initState() {
    super.initState();
    _myCoursesCubit = MyCoursesCubit();
  }

  @override
  void dispose() {
    _myCoursesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7);
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    return BlocProvider(
      create: (context) => _myCoursesCubit,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            // Header
            MyCoursesHeader(
              isDarkMode: isDarkMode,
              textColor: textColor,
              myCoursesCubit: _myCoursesCubit,
            ),
            Expanded(
              child: BlocBuilder<MyCoursesCubit, MyCoursesStates>(
                builder: (context, state) {
                  if (state is DataLoading) {
                    return Center(
                      child: mainLoading,
                    );
                  } else if (state is DataFailed) {
                    return DataErrorWidget(
                      message: state.errorMessage,
                    );
                  } else if (state is DataEmpty) {
                    return MyCoursesEmptyState(
                      context: context,
                      tabController: widget.tabController,
                      isDarkMode: isDarkMode,
                      textColor: textColor,
                    );
                  } else if (state is DataLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return EnrolledCourseCard(
                          course: state.data[index].course,
                          isRated: state.data[index].isRated,
                          status: _getCourseStatus(
                            state.data[index].course,
                            state.data[index].status,
                          ),
                          progress: state.data[index].progress,
                          onTap: () {
                            _navigateToCourseDetails(
                              state.data[index].course,
                            );
                          },
                        );
                      },
                    );
                  }

                  // Initial state, show loading
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCourseStatus(CourseModel course, bool? accepted) {
    if (accepted == null) {
      return 'Pending';
    } else if (accepted) {
      if (course.courseEndDate.toDate().isBefore(DateTime.now())) {
        return 'Completed';
      } else {
        return 'In Progress';
      }
    } else {
      return 'Rejected';
    }
  }

  void _navigateToCourseDetails(CourseModel course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsView(
          course: course,
          tags: {
            'category': course.category,
            'instructor': course.instructor,
          },
          hideEnrollButton: true,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
