import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Data/commnuity_repo.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_states.dart';

class CommunityCubit extends Cubit<CommunityStates> {
  CommunityCubit() : super(CommunityInitialState()) {
    _getPosts();
    log('started community');
  }

  final CommnuityRepo repo = CommnuityRepo();
  StreamSubscription? postSubscription;
  StreamSubscription? likeSubscription;

  void _getPosts() {
    emit(DataLoading());
    postSubscription = repo.getPosts().listen(
      (posts) {
        if (posts.isEmpty) {
          emit(DataEmpty());
        } else {
          emit(
            DataLoaded(
              posts: posts,
            ),
          );
        }
      },
      onError: (error) => emit(
        DataFailed(
          errorMessage: error.toString(),
        ),
      ),
    );
  }

  void deletePost({required PostModel post}) async {
    emit(DeleteLoading());
    try {
      String message = await repo.deletePost(
        post: post,
      );
      emit(
        DeleteSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        DeleteFailed(errormessage: e.toString()),
      );
    }
  }

  void triggerLike({required String postID}) async {
    emit(LikeLoading());
    try {
      String message = await repo.triggerLike(
        postID: postID,
      );
      emit(LikeSuccess(successMessage: message));
    } catch (e) {
      emit(LikeFailed(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    postSubscription?.cancel();
    log('closed community');
    return super.close();
  }
}
