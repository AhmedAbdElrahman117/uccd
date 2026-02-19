import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Data/commnuity_repo_impl.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Community%20Cubit/community_states.dart';

class CommunityCubit extends Cubit<CommunityStates> {
  CommunityCubit() : super(CommunityInitialState()) {
    _getPosts();
  }

  final CommnuityRepoImpl repo = CommnuityRepoImpl();
  StreamSubscription? postSubscription;

  void _getPosts() {
    emit(DataLoading());
    postSubscription = repo.getPosts().listen(
      (posts) {
        posts.isEmpty ? emit(DataEmpty()) : emit(DataLoaded(posts: posts));
      },
      onError: (error) => emit(
        DataFailed(errorMessage: error),
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
    try {
      String message = await repo.triggerLike(
        postID: postID,
      );
      emit(LikeSuccess(successMessage: message));
    } catch (e) {
      emit(LikeFailed(errorMessage: e.toString()));
    }
  }
}
