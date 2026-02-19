import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_field.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comments_list_view.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({
    super.key,
    required this.post,
  });

  static const String id = '/CommentsView';
  final PostModel post;

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit(widget.post.postID!),
      child: Scaffold(
        body: Stack(
          children: [
            CustomSliverListView(
              appBarTitle: 'Comments',
              body: BlocConsumer<CommentCubit, CommentStates>(
                listener: _listener,
                buildWhen: (previous, current) {
                  return current is DataEmpty ||
                      current is InitialState ||
                      current is DataFailed ||
                      current is DataLoaded ||
                      current is DataLoading;
                },
                builder: (context, state) {
                  switch (state) {
                    case InitialState():
                      return const SizedBox();
                    case DataLoading():
                      return const LoadingIndicator();
                    case DataFailed():
                      return const DataErrorWidget();
                    case DataEmpty():
                      return const NoDataWidget(
                        message: 'No Comments',
                      );
                    case DataLoaded():
                      return CommentsListView(
                        comments: state.comments,
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
            BlocSelector<CommentCubit, CommentStates, bool>(
              selector: (state) {
                if (state is CommentLoading) {
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
        bottomNavigationBar: CommentField(
          postID: widget.post.postID!,
        ),
      ),
    );
  }

  void _listener(BuildContext context, CommentStates state) {
    if (state is CommentSuccess) {
      AppBanners.showSuccess(message: state.successMessage);
    } else if (state is CommentFailed) {
      AppBanners.showFailed(message: state.errorMessage);
    }
  }
}
