import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Category%20Cubit/admin_category_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Category%20Cubit/admin_category_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_list_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_view_fab.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class AdminCategoryView extends StatefulWidget {
  const AdminCategoryView({super.key});

  static const String id = '/CategoryView';

  @override
  State<AdminCategoryView> createState() => _AdminCategoryViewState();
}

class _AdminCategoryViewState extends State<AdminCategoryView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCategoryCubit(),
      child: Scaffold(
        backgroundColor: CategoryThemeHelper.getBackgroundColor(context),
        body: Stack(
          children: [
            CustomSliverListView(
              appBarTitle: S.of(context).categories,
              body: BlocConsumer<AdminCategoryCubit, AdminCategoryStates>(
                listener: _listener,
                buildWhen: (previous, current) {
                  return current is DataLoading ||
                      current is DataLoaded ||
                      current is DataEmpty ||
                      current is CategoryInitialState ||
                      current is DataFailed;
                },
                builder: (context, state) {
                  switch (state) {
                    case CategoryInitialState():
                      return const SizedBox();
                    case DataLoading():
                      return const LoadingIndicator();
                    case DataFailed():
                      return const DataErrorWidget();
                    case DataEmpty():
                      return Container(
                        color: CategoryThemeHelper.getBackgroundColor(context),
                        child: NoDataWidget(
                          message: S.of(context).noRegisteredCategories,
                        ),
                      );
                    case DataLoaded():
                      return CategoryListView(
                        categories: state.categories,
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
            BlocSelector<AdminCategoryCubit, AdminCategoryStates, bool>(
              selector: (state) {
                if (state is DeleteLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: const CategoryViewFab(),
      ),
    );
  }

  void _listener(BuildContext context, AdminCategoryStates state) {
    if (state is DeleteSuccess) {
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(
          state.errorMessage,
          context,
        ),
      );
    }
  }
}
