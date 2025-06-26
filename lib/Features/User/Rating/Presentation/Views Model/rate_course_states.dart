sealed class RateCourseStates {}

class RateCourseInitialState extends RateCourseStates {}

class RateCourseLoading extends RateCourseStates {}

class RateCourseSuccess extends RateCourseStates {}

class RateCourseError extends RateCourseStates {
  final String errorMessage;

  RateCourseError(this.errorMessage);
}
