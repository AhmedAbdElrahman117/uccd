import 'package:uccd/Core/Models/comment_model.dart';

sealed class CommentStates {}

class InitialState extends CommentStates {}

class DataLoading extends CommentStates {}

class DataLoaded extends CommentStates {
  final List<CommentModel> comments;

  DataLoaded({required this.comments});
}

class DataFailed extends CommentStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataEmpty extends CommentStates {}

class CommentLoading extends CommentStates {}

class CommentSuccess extends CommentStates {
  final String successMessage;

  CommentSuccess({required this.successMessage});
}

class CommentFailed extends CommentStates {
  final String errorMessage;

  CommentFailed({required this.errorMessage});
}
