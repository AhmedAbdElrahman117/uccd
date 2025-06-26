import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_cubit.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_states.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/instrcutor_courses_failed_state.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/instructor_course_card.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/instructor_courses_empty_state.dart';
import 'package:uccd/Features/Instructor/Presentation/instructor_course_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/home_welcome_section.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorHomeView extends StatefulWidget {
  const InstructorHomeView({
    super.key,
    required this.tabController,
    required this.instructorCubit,
  });

  final TabController tabController;
  final InstructorCubit instructorCubit;

  @override
  State<InstructorHomeView> createState() => _InstructorHomeViewState();
}

class _InstructorHomeViewState extends State<InstructorHomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeWelcomeSection(
            onAvatarTap: () {
              widget.tabController.animateTo(2);
            },
            onContinueLearningTap: () {},
            showContinueLearningButton: false,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 10,
            ),
            child: SectionTitle(
              title: S.of(context).assignedCourses,
            ),
          ),
        ),
        BlocBuilder<InstructorCubit, InstructorStates>(
          builder: (context, state) {
            if (state is InstructorInitialState) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: LoadingIndicator(),
                  ),
                ),
              );
            } else if (state is InstructorCoursesEmpty) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: InstructorCoursesEmptyState(),
              );
            } else if (state is InstructorCoursesFailed) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: InstrcutorCoursesFailedState(
                  errorMessage: state.errorMessage,
                ),
              );
            } else if (state is InstructorCoursesLoaded) {
              return SliverList.builder(
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  return InstructorCourseCard(
                    course: state.courses[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return InstructorCourseView(
                              course: state.courses[index],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              );
            }
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoadingIndicator(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
