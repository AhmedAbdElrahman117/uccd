sealed class AddPostStates {}

class InitialState extends AddPostStates {}

class AddUpdateLoading extends AddPostStates {}

class AddUpdateSuccess extends AddPostStates {
  final String successMessage;

  AddUpdateSuccess({required this.successMessage});
}

class AddUpdateFailed extends AddPostStates {
  final String errormessage;

  AddUpdateFailed({required this.errormessage});
}
