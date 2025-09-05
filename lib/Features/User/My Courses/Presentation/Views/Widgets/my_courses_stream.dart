import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_cubit.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views/Widgets/my_courses_list.dart';

class MyCoursesStream extends StatelessWidget {
  const MyCoursesStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesCubit(),
      child: BlocBuilder<MyCoursesCubit, MyCoursesStates>(
        builder: (context, state) {
          switch (state) {
            case InitialState():
              return const SizedBox();
            case DataLoading():
              return const LoadingIndicator();
            case DataFailed():
              return Text(state.errorMessage);
            case DataEmpty():
              return const NoDataWidget(message: 'No Enrollements yet');
            case DataLoaded():
              return MyCoursesList(
                courses: state.data,
              );
          }
        },
      ),
    );
  }
}
