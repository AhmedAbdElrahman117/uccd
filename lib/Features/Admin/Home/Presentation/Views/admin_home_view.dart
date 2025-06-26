import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views%20Model/admin_home_cubit.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views%20Model/admin_home_states.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/AppBar/admin_app_bar.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Dashboard/admin_dashboard.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/quick_actions.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => AdminHomeCubit()..getStats(),
      child: Scaffold(
        backgroundColor: AdminHomeThemeHelper.getBackgroundColor(context),
        body: Container(
          decoration: BoxDecoration(
            gradient: AdminHomeThemeHelper.getBackgroundGradient(context),
          ),
          child: BlocConsumer<AdminHomeCubit, AdminHomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: AdminAppBar(
                      onProfileTap: () {
                        widget.tabController.animateTo(3);
                      },
                      dashboardData:
                          state is AdminHomeLoaded ? state.stats : null,
                    ),
                  ),

                  // Enhanced Quick Actions
                  const SliverToBoxAdapter(
                    child: QuickActions(),
                  ),

                  // Enhanced Dashboard with dynamic data
                  SliverToBoxAdapter(
                    child: _buildDashboard(state),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard(AdminHomeStates state) {
    switch (state) {
      case AdminHomeLoading():
        return Container(
          height: 400,
          padding: const EdgeInsets.all(AdminHomeThemeHelper.spacingMedium),
          child: const Center(
            child: LoadingIndicator(),
          ),
        );
      case AdminHomeLoaded():
        return AdminDashboard(
          tabController: widget.tabController,
          dashboardData: state.stats,
        );
      case AdminHomeFailed():
        return Container(
          padding: const EdgeInsets.all(AdminHomeThemeHelper.spacingMedium),
          child: DataErrorWidget(
            message: state.errorMessage,
          ),
        );
      case AdminHomeInitialState():
        return Container(
          height: 400,
          padding: const EdgeInsets.all(AdminHomeThemeHelper.spacingMedium),
          child: const Center(
            child: LoadingIndicator(),
          ),
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
