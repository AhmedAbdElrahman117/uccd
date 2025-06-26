import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Features/Community/Data/commnuity_repo.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Comments%20Cubit/comment_states.dart';

class CommentCubit extends Cubit<CommentStates> {
  CommentCubit(this.postID) : super(InitialState()) {
    getComments();
  }

  final String postID;
  final CommnuityRepo repo = CommnuityRepo();
  StreamSubscription? commentSubscription;

  void getComments() {
    emit(DataLoading());
    commentSubscription = repo.getComments(postID: postID).listen(
      (comments) {
        comments.isEmpty
            ? emit(DataEmpty())
            : emit(
                DataLoaded(comments: comments),
              );
      },
      onError: (error) => emit(DataFailed(errorMessage: error)),
    );
  }

  void comment({
    required CommentModel comment,
  }) async {
    if (comment.comment.trim().isNotEmpty) {
      emit(CommentLoading());
      try {
        String message = await repo.addComment(
          comment: comment,
          postID: postID,
        );
        emit(
          CommentSuccess(successMessage: message),
        );
      } catch (e) {
        emit(
          CommentFailed(errorMessage: e.toString()),
        );
      }
    } else {
      emit(
        CommentFailed(errorMessage: 'Comment cannot be empty'),
      );
    }
  }

  @override
  Future<void> close() {
    commentSubscription?.cancel();
    return super.close();
  }
}
