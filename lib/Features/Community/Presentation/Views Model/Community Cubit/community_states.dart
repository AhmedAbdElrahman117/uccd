import 'package:uccd/Core/Models/post_model.dart';

sealed class CommunityStates {}

class CommunityInitialState extends CommunityStates {}

class DataLoading extends CommunityStates {}

class DataFailed extends CommunityStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends CommunityStates {
  final List<PostModel> posts;

  DataLoaded({required this.posts});
}

class DataEmpty extends CommunityStates {}

class DeleteLoading extends CommunityStates {}

class DeleteSuccess extends CommunityStates {
  final String successMessage;

  DeleteSuccess({required this.successMessage});
}

class DeleteFailed extends CommunityStates {
  final String errormessage;

  DeleteFailed({required this.errormessage});
}

class LikeLoading extends CommunityStates {}

class LikeSuccess extends CommunityStates {
  final String successMessage;

  LikeSuccess({required this.successMessage});
}

class LikeFailed extends CommunityStates {
  final String errorMessage;

  LikeFailed({required this.errorMessage});
}
