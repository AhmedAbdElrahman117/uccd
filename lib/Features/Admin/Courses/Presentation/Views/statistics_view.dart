import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Statistics%20Cubit/statistics_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Statistics%20Cubit/statistics_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/course_statistics_box.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/interview_statistics_box.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_department_statistics.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_year_and_department.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_year_statistics.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key, required this.course});

  static const String id = '/StatisticsView';
  final CourseModel course;

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  PageController boxController = PageController();
  PageController statsController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(
        courseID: widget.course.courseID!,
      ),
      child: Scaffold(
        body: CustomSliverListView(
          appBarTitle: 'Statistics',
          body: BlocBuilder<StatisticsCubit, StatisticsStates>(
            builder: (context, state) {
              switch (state) {
                case StatisticsInitialState():
                  return const SizedBox();
                case DataLoading():
                  return const LoadingIndicator();
                case DataFailed():
                  return DataErrorWidget(
                    message: state.errorMessage,
                  );
                case DataLoaded():
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: ExpandablePageView(
                            controller: boxController,
                            children: [
                              CourseStatisticsBox(
                                data: {
                                  'Total Students':
                                      widget.course.maxAcceptedStudents,
                                  'Enrollments': state.statistics['Total'],
                                  'Available':
                                      widget.course.maxAcceptedStudents -
                                          state.statistics['Total'],
                                },
                              ),
                              InterviewStatisticsBox(
                                data: {
                                  'Pending': state.statistics['Pending'],
                                  'Accepted': state.statistics['Accepted'],
                                  'Rejected': state.statistics['Rejected'],
                                },
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: PageIndicator(
                            pageController: boxController,
                            pagesCount: 2,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 18),
                        ),
                        SliverToBoxAdapter(
                          child: ExpandablePageView(
                            controller: statsController,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              StudentsByDepartmentStatistics(
                                data: {
                                  calcPercentage(
                                    state.statistics['It'],
                                    state.statistics['Total'],
                                  ): state.statistics['It'],
                                  calcPercentage(
                                    state.statistics['Mecha'],
                                    state.statistics['Total'],
                                  ): state.statistics['Mecha'],
                                  calcPercentage(
                                    state.statistics['Auto'],
                                    state.statistics['Total'],
                                  ): state.statistics['Auto'],
                                  calcPercentage(
                                    state.statistics['RE'],
                                    state.statistics['Total'],
                                  ): state.statistics['RE'],
                                  calcPercentage(
                                    state.statistics['O&P'],
                                    state.statistics['Total'],
                                  ): state.statistics['O&P'],
                                },
                              ),
                              StudentsByYearStatistics(
                                data: {
                                  calcPercentage(
                                    state.statistics['First'],
                                    state.statistics['Total'],
                                  ): state.statistics['First'],
                                  calcPercentage(
                                    state.statistics['Second'],
                                    state.statistics['Total'],
                                  ): state.statistics['Second'],
                                  calcPercentage(
                                    state.statistics['Third'],
                                    state.statistics['Total'],
                                  ): state.statistics['Third'],
                                  calcPercentage(
                                    state.statistics['Fourth'],
                                    state.statistics['Total'],
                                  ): state.statistics['Fourth'],
                                },
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: PageIndicator(
                            pageController: statsController,
                            pagesCount: 2,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 18),
                        ),
                        SliverToBoxAdapter(
                          child: StudentsByYearAndDepartment(
                            data: {
                              'IT': state.statistics['ITByYear'],
                              'Mecha': state.statistics['MechaByYear'],
                              'Auto': state.statistics['AutoByYear'],
                              'RE': state.statistics['REByYear'],
                              'O&P': state.statistics['OPByYear'],
                            },
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  double calcPercentage(num part, num total) {
    double res = ((part / total) * 100);

    return roundToDecimal(res);
  }

  double roundToDecimal(double value) {
    if (value.isNaN || value.isInfinite) {
      return 0.0;
    }
    num mod = pow(10.0, 1);
    return ((value * mod).round().toDouble() / mod);
  }
}
