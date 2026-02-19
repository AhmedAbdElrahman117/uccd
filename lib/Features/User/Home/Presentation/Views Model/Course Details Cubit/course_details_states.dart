sealed class CourseDetailsStates {}

class InitialState extends CourseDetailsStates {}

class StatusLoading extends CourseDetailsStates {}

class StatusFailed extends CourseDetailsStates {
  final String errorMessage;

  StatusFailed({required this.errorMessage});
}

class StatusLoaded extends CourseDetailsStates {
  final String status;
  final bool canEnroll;

  StatusLoaded({required this.status, required this.canEnroll});
}

class RegisterLoading extends CourseDetailsStates {}

class RegisterSuccess extends CourseDetailsStates {}

class RegisterFailed extends CourseDetailsStates {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}
