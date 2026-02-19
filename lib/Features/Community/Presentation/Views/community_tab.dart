import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/community_empty_state.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/community_header.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/community_post_card.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab>
    with AutomaticKeepAliveClientMixin {
  late CommunityCubit _communityCubit;

  @override
  void initState() {
    super.initState();
    _communityCubit = CommunityCubit();
  }

  @override
  void dispose() {
    _communityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return BlocProvider(
      create: (context) => _communityCubit,
      child: Scaffold(
        backgroundColor: AdminHomeThemeHelper.getBackgroundColor(context),
        body: Container(
          color: isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CommunityHeader(
                  isDarkMode: isDarkMode,
                  textColor: textColor,
                ),
              ),
              BlocConsumer<CommunityCubit, CommunityStates>(
                bloc: _communityCubit,
                buildWhen: (previous, current) {
                  return current is DataLoading ||
                      current is DataLoaded ||
                      current is DataEmpty ||
                      current is DataFailed;
                },
                listener: _listener,
                builder: (context, state) {
                  switch (state) {
                    case CommunityInitialState():
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: SizedBox(),
                      );
                    case DataLoading():
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: mainLoading,
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
                        child: CommunityEmptyState(),
                      );
                    case DataLoaded():
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        sliver: SliverList.builder(
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: CommunityPostCard(
                                post: state.posts[index],
                                communityCubit: _communityCubit,
                                onDelete: () {
                                  _communityCubit.deletePost(
                                    post: state.posts[index],
                                  );
                                },
                                onLike: () {
                                  _communityCubit.triggerLike(
                                    postID: state.posts[index].postID!,
                                  );
                                },
                                isDarkMode: isDarkMode,
                              ),
                            );
                          },
                        ),
                      );

                    default:
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: SizedBox(),
                      );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: InternalStorage.getString('role') != 'Student',
          child: FloatingActionButton.extended(
            backgroundColor: AppColor.primary,
            onPressed: () {
              OverlayController.showCreatePostDialog(context);
            },
            label: Text(
              S.of(context).createPostButton,
              style: AppText.style16Regular(context).copyWith(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, CommunityStates state) {
    if (state is DeleteSuccess) {
      AppBanners.showSuccess(
        message: state.successMessage,
      );
    } else if (state is LikeFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    } else if (state is DeleteFailed) {
      AppBanners.showFailed(
        message: state.errormessage,
      );
    } else if (state is LikeSuccess) {
      AppBanners.showLikeSuccess(
        message: state.successMessage,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
