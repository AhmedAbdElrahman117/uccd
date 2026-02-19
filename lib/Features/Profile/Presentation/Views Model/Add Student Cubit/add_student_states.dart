sealed class AddStudentStates {}

class InitialState extends AddStudentStates {}

class AddUpdateLoading extends AddStudentStates {}

class AddUpdateFailed extends AddStudentStates {
  final String errorMessage;

  AddUpdateFailed({required this.errorMessage});
}

class AddUpdateSuccess extends AddStudentStates {
  final String successMessage;

  AddUpdateSuccess({required this.successMessage});
}
