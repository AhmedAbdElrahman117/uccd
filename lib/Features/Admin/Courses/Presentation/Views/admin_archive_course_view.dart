import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Archive%20Course%20Cubit/archive_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Archive%20Course%20Cubit/archive_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/admin_archive_course_list.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Themes/admin_courses_theme_helper.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_courses_error_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_courses_loading_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/enhanced_empty_courses_widget.dart';

class AdminArchiveCourseView extends StatefulWidget {
  const AdminArchiveCourseView({
    super.key,
  });

  @override
  State<AdminArchiveCourseView> createState() => _AdminArchiveCourseViewState();
}

class _AdminArchiveCourseViewState extends State<AdminArchiveCourseView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(
        gradient: AdminCoursesThemeHelper.getBackgroundGradient(context),
      ),
      child: BlocProvider(
        create: (context) => ArchiveCourseCubit(),
        child: BlocBuilder<ArchiveCourseCubit, ArchiveCourseStates>(
          builder: (context, state) {
            switch (state) {
              case ArchiveCourseInitialState():
                return const EnhancedCoursesLoadingWidget();
              case DataLoading():
                return const EnhancedCoursesLoadingWidget();
              case DataEmpty():
                return const EnhancedEmptyCoursesWidget(
                  message: 'No courses in the archive yet',
                  showCreateButton: false,
                );
              case DataFailed():
                return EnhancedCoursesErrorWidget(
                  message: state.errorMessage,
                );
              case DataLoaded():
                return AdminArchiveCourseList(
                  courses: state.archiveCourses,
                );
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
