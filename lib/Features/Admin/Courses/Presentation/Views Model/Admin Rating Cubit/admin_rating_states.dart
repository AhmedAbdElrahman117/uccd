import 'package:uccd/Core/Models/rating_model.dart';

sealed class AdminRatingStates {}

class AdminRatingInitialState extends AdminRatingStates {}

class AdminRatingLoading extends AdminRatingStates {}

class AdminRatingLoaded extends AdminRatingStates {
  final List<RatingModel> ratings;

  AdminRatingLoaded({required this.ratings});
}

class AdminRatingEmpty extends AdminRatingStates {}

class AdminRatingFailed extends AdminRatingStates {
  final String errorMessage;

  AdminRatingFailed({required this.errorMessage});
}
