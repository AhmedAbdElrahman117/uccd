import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/Components/custom_fab.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';
import 'package:uccd/main.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => CommunityCubit(),
      child: Scaffold(
        body: CustomSliverListView(
          appBarTitle: 'Community',
          body: Stack(
            children: [
              BlocConsumer<CommunityCubit, CommunityStates>(
                listener: _listener,
                buildWhen: (previous, current) {
                  return current is CommunityInitialState ||
                      current is DataLoading ||
                      current is DataLoaded ||
                      current is DataFailed ||
                      current is DataEmpty;
                },
                builder: (context, state) {
                  switch (state) {
                    case CommunityInitialState():
                      return const SizedBox();
                    case DataLoading():
                      return const LoadingIndicator();
                    case DataFailed():
                      return const DataErrorWidget();
                    case DataEmpty():
                      return const NoDataWidget(
                        message: 'No Posts Published yet',
                      );
                    case DataLoaded():
                      return PostsListView(
                        posts: state.posts,
                      );
                    default:
                      return Container();
                  }
                },
              ),
              BlocSelector<CommunityCubit, CommunityStates, bool>(
                selector: (state) {
                  if (state is DeleteLoading) {
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
          ),
        ),
        floatingActionButton: Visibility(
          visible: InternalStorage.getString('role') == 'Admin',
          child: CustomFab(
            onPressed: () {
              OverlayController.showAddPostDialog(context);
            },
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, CommunityStates state) {
    if (state is DeleteLoading) {
      context.pop();
    } else if (state is DeleteSuccess) {
      AppBanners.showSuccess(
        message: state.successMessage,
      );
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(
        message: state.errormessage,
      );
    } else if (state is LikeSuccess) {
      AppBanners.showLikeSuccess(
        message: state.successMessage,
      );
    } else if (state is LikeFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
        alignment: Alignment.bottomCenter,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
