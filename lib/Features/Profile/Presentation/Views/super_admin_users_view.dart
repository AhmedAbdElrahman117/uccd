import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Admins/admins_list_view.dart';

class SuperAdminUsersView extends StatefulWidget {
  const SuperAdminUsersView({super.key, required this.cubit});

  final AdminUsersCubit cubit;

  @override
  State<SuperAdminUsersView> createState() => _SuperAdminUsersViewState();
}

class _SuperAdminUsersViewState extends State<SuperAdminUsersView> {
  @override
  void initState() {
    widget.cubit.getAdmins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            BlocConsumer<AdminUsersCubit, AdminUsersStates>(
              bloc: widget.cubit,
              listener: (context, state) {
                if (state is AdminDeleteSuccess) {
                  AppBanners.showSuccess(
                    message: state.successMessage,
                  );
                } else if (state is AdminDeleteFailed) {
                  AppBanners.showFailed(
                    message: state.errorMessage,
                  );
                }
              },
              buildWhen: (previous, current) {
                return current is AdminUsersInitialState ||
                    current is AdminDataLoading ||
                    current is AdminDataEmpty ||
                    current is AdminDataFailed ||
                    current is AdminDataLoaded;
              },
              builder: (context, state) {
                switch (state) {
                  case AdminUsersInitialState():
                    return const SizedBox();
                  case AdminDataLoading():
                    return const LoadingIndicator();
                  case AdminDataEmpty():
                    return const NoDataWidget(
                      message: 'No Registered Admins',
                    );
                  case AdminDataFailed():
                    return DataErrorWidget(
                      message: state.errorMessage,
                    );
                  case AdminDataLoaded():
                    return AdminsListView(
                      admins: state.admins,
                      cubit: widget.cubit,
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFab(
        onPressed: () {
          OverlayController.showAddAdminDialog(
            context,
          );
        },
      ),
    );
  }
}
