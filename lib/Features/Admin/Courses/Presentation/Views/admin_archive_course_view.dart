import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Archive%20Course%20Cubit/archive_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Archive%20Course%20Cubit/archive_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/admin_archive_course_list.dart';

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
    return BlocProvider(
      create: (context) => ArchiveCourseCubit(),
      child: BlocBuilder<ArchiveCourseCubit, ArchiveCourseStates>(
        builder: (context, state) {
          switch (state) {
            case ArchiveCourseInitialState():
              return const SizedBox();
            case DataLoading():
              return const LoadingIndicator();
            case DataEmpty():
              return const NoDataWidget(
                message: 'No Courses in The Archive yet',
              );
            case DataFailed():
              return DataErrorWidget(
                message: state.errorMessage,
              );
            case DataLoaded():
              return AdminArchiveCourseList(
                courses: state.archiveCourses,
              );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
