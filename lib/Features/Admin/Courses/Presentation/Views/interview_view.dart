import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Interview%20Cubit/interview_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Interview%20Cubit/interview_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Interview/interview_list.dart';
import 'package:uccd/generated/l10n.dart';

class InterviewView extends StatefulWidget {
  const InterviewView({super.key, this.course});

  static const String id = '/InterviewView';
  final CourseModel? course;

  @override
  State<InterviewView> createState() => _InterviewViewState();
}

class _InterviewViewState extends State<InterviewView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => InterviewCubit(
        courseID: widget.course!.courseID!,
      ),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                CustomSliverListView(
                  appBarTitle: S.of(context).interview,
                  body: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: FilterChips(
                          options: [
                            S.of(context).all,
                            S.of(context).pending,
                            S.of(context).accepted,
                            S.of(context).rejected,
                          ],
                          onChange: (option) {
                            // Map localized option back to English for cubit
                            String englishOption = _mapToEnglishOption(option);
                            BlocProvider.of<InterviewCubit>(context).filter(
                              filter: englishOption,
                            );
                          },
                        ),
                      ),
                      BlocConsumer<InterviewCubit, InterviewStates>(
                        listener: _listener,
                        buildWhen: (previous, current) {
                          return current is InterviewInitialState ||
                              current is DataEmpty ||
                              current is DataFailed ||
                              current is DataLoaded ||
                              current is DataLoading;
                        },
                        builder: (context, state) {
                          switch (state) {
                            case InterviewInitialState():
                              return const SliverToBoxAdapter(
                                child: SizedBox(),
                              );
                            case DataLoading():
                              return const SliverFillRemaining(
                                child: Center(
                                  child: LoadingIndicator(),
                                ),
                              );
                            case DataEmpty():
                              return SliverFillRemaining(
                                child: Center(
                                  child: NoDataWidget(
                                    message:
                                        S.of(context).noStudentsToInterview,
                                  ),
                                ),
                              );
                            case DataFailed():
                              return SliverFillRemaining(
                                child: Center(
                                    child: DataErrorWidget(
                                  message: state.errorMessage,
                                )),
                              );
                            case DataLoaded():
                              return InterviewList(
                                data: state.students,
                                course: widget.course!,
                              );
                            default:
                              return SliverToBoxAdapter(
                                child: Container(),
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                BlocSelector<InterviewCubit, InterviewStates, bool>(
                  selector: (state) {
                    if (state is InterviewLoading) {
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
            );
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, InterviewStates state) {
    if (state is InterviewSuccess) {
      AppBanners.showSuccess(
        message: S.of(context).studentAcceptedSuccessfully,
      );
    } else if (state is InterviewFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    }
  }

  String _mapToEnglishOption(String localizedOption) {
    if (localizedOption == S.of(context).all) return 'All';
    if (localizedOption == S.of(context).pending) return 'Pending';
    if (localizedOption == S.of(context).accepted) return 'Accepted';
    if (localizedOption == S.of(context).rejected) return 'Rejected';
    return localizedOption; // fallback
  }

  @override
  bool get wantKeepAlive => true;
}
