import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/course_delete_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/course_edit_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/course_interview_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/course_statisitcs_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';

class AdminCourseMenu extends StatelessWidget {
  const AdminCourseMenu({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AvailableCourseCubit.noGetter(),
      child: BlocListener<AvailableCourseCubit, AvailableCourseStates>(
        listener: _listener,
        child: Stack(
          children: [
            OverlayBackground(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Text(
                    'Panel',
                    style: AppText.style20Bold(context),
                  ),
                  GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      mainAxisExtent: 120,
                    ),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      CourseStatisitcsButton(
                        course: course,
                      ),
                      CourseInterviewButton(
                        course: course,
                      ),
                      CourseEditButton(
                        course: course,
                      ),
                      MenuButton(
                        title: 'Change Instructor',
                        icon: FontAwesomeIcons.userGear,
                        backgroundColor: Colors.brown,
                        onTap: () {
                          OverlayController.showChangeInstructor(
                            context,
                            course,
                          );
                        },
                      ),
                      MenuButton(
                        title: 'Change Category',
                        icon: Icons.category,
                        backgroundColor: Colors.blueGrey,
                        onTap: () {
                          OverlayController.showChangeCategory(
                            context,
                            course,
                          );
                        },
                      ),
                      CourseDeleteButton(
                        course: course,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocSelector<AvailableCourseCubit, AvailableCourseStates, bool>(
              selector: (state) {
                if (state is DeleteLoading) {
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
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AvailableCourseStates state) {
    if (state is DeleteSuccess) {
      AppBanners.showSuccess(message: state.successMessage);
      context.pop();
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(message: state.errorMessage);
    }
  }
}
