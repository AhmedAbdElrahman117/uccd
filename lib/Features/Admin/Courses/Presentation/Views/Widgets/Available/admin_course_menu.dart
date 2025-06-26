import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_overlay_background.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_statistics_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_interview_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_edit_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_change_instructor_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_change_category_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_delete_button.dart';
import 'package:uccd/generated/l10n.dart';

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
            EnhancedOverlayBackground(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Text(
                    S.of(context).controlPanel,
                    style: AppText.style20Bold(context),
                  ),
                  MasonryGridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: EdgeInsets.zero,
                    children: [
                      EnhancedStatisticsButton(
                        course: course,
                      ),
                      EnhancedInterviewButton(
                        course: course,
                      ),
                      EnhancedEditButton(
                        course: course,
                      ),
                      EnhancedChangeInstructorButton(
                        course: course,
                      ),
                      EnhancedChangeCategoryButton(
                        course: course,
                      ),
                      EnhancedDeleteButton(
                        course: course,
                      ),
                    ],
                  )
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
      AppBanners.showSuccess(
        message: state.successMessage,
      );
      context.pop();
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    }
  }
}
