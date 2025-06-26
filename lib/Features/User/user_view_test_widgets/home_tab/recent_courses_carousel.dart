import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/recent_course_card.dart';
import 'package:uccd/generated/l10n.dart';

class RecentCoursesCarousel extends StatelessWidget {
  const RecentCoursesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeStates>(
      builder: (context, state) {
        if (state is DataLoading) {
          return Center(
            child: mainLoading,
          );
        } else if (state is DataFailed) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${S.of(context).failedToLoadCourses}: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is DataEmpty) {
          return NoDataWidget(
            message: S.of(context).noCoursesAvailable,
            showImage: false,
          );
        } else if (state is DataLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: state.courses.take(5).indexed.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: RecentCourseCard(
                      course: state.courses[e.$1],
                      index: e.$1,
                    ),
                  );
                },
              ).toList(),
            ),
          );
        }

        // Initial or unknown state
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
