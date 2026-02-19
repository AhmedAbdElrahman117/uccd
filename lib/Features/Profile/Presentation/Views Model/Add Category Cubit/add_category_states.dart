sealed class AddCategoryStates {}

class AddCategoryInitialState extends AddCategoryStates {}

class AddUpdateLoading extends AddCategoryStates {}

class AddUpdateSuccess extends AddCategoryStates {
  final String successMessage;

  AddUpdateSuccess({required this.successMessage});
}

class AddUpdateFailed extends AddCategoryStates {
  final String errorMessage;

  AddUpdateFailed({required this.errorMessage});
}
