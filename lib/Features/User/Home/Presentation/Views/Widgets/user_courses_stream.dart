import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course/user_courses_list.dart';

class UserCoursesStream extends StatelessWidget {
  const UserCoursesStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeStates>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            return const SliverToBoxAdapter(
              child: SizedBox(),
            );
          case DataLoading():
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: LoadingIndicator(),
              ),
            );
          case DataFailed():
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: DataErrorWidget(
                  message: state.errorMessage,
                ),
              ),
            );
          case DataEmpty():
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: NoDataWidget(
                  message: 'No Courses Available',
                ),
              ),
            );
          case DataLoaded():
            return UserCoursesList(
              data: state.courses,
            );
        }
      },
    );
  }
}
