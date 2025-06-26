class AddInstructorStates {}

class InitialState extends AddInstructorStates {}

class AddUpdateLoading extends AddInstructorStates {}

class AddUpdateFailed extends AddInstructorStates {
  final String errorMessage;

  AddUpdateFailed({required this.errorMessage});
}

class AddUpdateSuccess extends AddInstructorStates {
  final String successMessage;

  AddUpdateSuccess({required this.successMessage});
}
