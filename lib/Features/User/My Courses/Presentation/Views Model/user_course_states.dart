class UserCourseStates {}

class UserCourseInitialStates extends UserCourseStates {}

class RegisterSuccess extends UserCourseStates {
  final String successMessage;

  RegisterSuccess({required this.successMessage});
}

class RegisterFailed extends UserCourseStates {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}

class RegisterLoading extends UserCourseStates {}
