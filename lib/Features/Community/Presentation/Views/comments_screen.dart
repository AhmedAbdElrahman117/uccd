import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/Community/Presentation/Views Model/Comments Cubit/comment_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views Model/Comments Cubit/comment_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_field.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comment_item.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comments_appbar.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/comments_empty_state.dart';
import 'package:uccd/generated/l10n.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({
    super.key,
    required this.postID,
  });

  final String postID;

  static const String id = '/CommentsView';

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late TextEditingController _commentController;
  late CommentCubit _commentCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _commentCubit = CommentCubit(widget.postID);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7);
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor =
        isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700;

    return BlocProvider.value(
      value: _commentCubit,
      child: BlocListener<CommentCubit, CommentStates>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      CommentsAppbar(
                        cardColor: cardColor,
                        isDarkMode: isDarkMode,
                        textColor: textColor,
                      ),
                      BlocBuilder<CommentCubit, CommentStates>(
                        buildWhen: (previous, current) {
                          return current is DataLoading ||
                              current is DataLoaded ||
                              current is DataFailed ||
                              current is DataEmpty;
                        },
                        builder: (context, state) {
                          if (state is DataLoading) {
                            return SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: mainLoading,
                              ),
                            );
                          } else if (state is DataFailed) {
                            return SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: DataErrorWidget(
                                  message: S
                                      .of(context)
                                      .errorLoadingComments(state.errorMessage),
                                ),
                              ),
                            );
                          } else if (state is DataEmpty) {
                            return CommentsEmptyState(
                              textColor: textColor,
                            );
                          } else if (state is DataLoaded) {
                            return SliverPadding(
                              padding: const EdgeInsets.all(16),
                              sliver: SliverList.builder(
                                itemCount: state.comments.length,
                                itemBuilder: (context, index) {
                                  return CommentItem(
                                    comment: state.comments[index],
                                    cardColor: cardColor,
                                    textColor: textColor,
                                    subTextColor: subTextColor,
                                  );
                                },
                              ),
                            );
                          }

                          // Initial state or unknown state
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: mainLoading,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SafeArea(
                  bottom: true,
                  child: CommentField(
                    commentController: _commentController,
                    commentCubit: _commentCubit,
                    formKey: _formKey,
                    cardColor: cardColor,
                    isDarkMode: isDarkMode,
                    textColor: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, CommentStates state) {
    if (state is CommentSuccess) {
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
    } else if (state is CommentLoading) {
      _commentController.clear();
    } else if (state is CommentFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(
          state.errorMessage,
          context,
        ),
      );
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentCubit.close();
    super.dispose();
  }
}
