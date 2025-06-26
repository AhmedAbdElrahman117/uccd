import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Statistics%20Cubit/statistics_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Statistics%20Cubit/statistics_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/course_statistics_box.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/interview_statistics_box.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_department_statistics.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_year_and_department.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/students_by_year_statistics.dart';
import 'package:uccd/generated/l10n.dart';

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
          appBarTitle: S.of(context).statistics,
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
                                  S.of(context).totalStudents:
                                      AppDates.formatLocalizedNumber(
                                          widget.course.maxAcceptedStudents,
                                          context),
                                  S.of(context).enrollments:
                                      AppDates.formatLocalizedNumber(
                                          state.statistics['Total'], context),
                                  S.of(context).available:
                                      AppDates.formatLocalizedNumber(
                                          widget.course.maxAcceptedStudents -
                                              state.statistics['Total'],
                                          context),
                                },
                              ),
                              InterviewStatisticsBox(
                                data: {
                                  S.of(context).pending:
                                      AppDates.formatLocalizedNumber(
                                          state.statistics['Pending'], context),
                                  S.of(context).accepted:
                                      AppDates.formatLocalizedNumber(
                                          state.statistics['Accepted'],
                                          context),
                                  S.of(context).rejected:
                                      AppDates.formatLocalizedNumber(
                                          state.statistics['Rejected'],
                                          context),
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
                                  (state.statistics['itPercent'] as num)
                                      .toDouble(): state.statistics['It'],
                                  (state.statistics['mechaPercent'] as num)
                                      .toDouble(): state.statistics['Mecha'],
                                  (state.statistics['autoPercent'] as num)
                                      .toDouble(): state.statistics['Auto'],
                                  (state.statistics['REPercent'] as num)
                                      .toDouble(): state.statistics['RE'],
                                  (state.statistics['OPPercent'] as num)
                                      .toDouble(): state.statistics['O&P'],
                                },
                              ),
                              StudentsByYearStatistics(
                                data: {
                                  (state.statistics['FirstPercent'] as num)
                                      .toDouble(): state.statistics['First'],
                                  (state.statistics['SecondPercent'] as num)
                                      .toDouble(): state.statistics['Second'],
                                  (state.statistics['ThirdPercent'] as num)
                                      .toDouble(): state.statistics['Third'],
                                  (state.statistics['FourthPercent'] as num)
                                      .toDouble(): state.statistics['Fourth'],
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
}
