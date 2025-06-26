import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_refresh_indicator.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Logs%20Cubit/admin_logs_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Logs%20Cubit/admin_logs_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Logs/date_selection.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Logs/logs_list_view.dart';
import 'package:uccd/generated/l10n.dart';

class LogsView extends StatefulWidget {
  const LogsView({super.key});

  static String id = '/LogsView';

  @override
  State<LogsView> createState() => _LogsViewState();
}

class _LogsViewState extends State<LogsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminLogsCubit(Timestamp.now()),
      child: Builder(
        builder: (context) {
          return CustomRefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<AdminLogsCubit>(context).getLogs();
            },
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: SectionTitle(
                      title: S.of(context).logs,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: DateSelection(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SectionTitle(
                        title: S.of(context).actions,
                      ),
                    ),
                  ),
                  BlocBuilder<AdminLogsCubit, AdminLogsStates>(
                    buildWhen: (previous, current) => current is! ChangeDate,
                    builder: (context, state) {
                      switch (state) {
                        case AdminLogsInitialState():
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
                        case DataEmpty():
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: NoDataWidget(
                                message: S.of(context).noLogsInThisDay,
                              ),
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
                        case DataLoaded():
                          return LogsListView(
                            logs: state.logs,
                          );
                        default:
                          return const SliverToBoxAdapter(
                            child: SizedBox(),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
