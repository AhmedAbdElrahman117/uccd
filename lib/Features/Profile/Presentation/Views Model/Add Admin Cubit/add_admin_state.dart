sealed class AddAdminState {}

class AddAdminCubitInitial extends AddAdminState {}

class AddAdminLoading extends AddAdminState {}

class AddAdminSuccess extends AddAdminState {}

class AddAdminFailed extends AddAdminState {
  final String errorMessage;

  AddAdminFailed(this.errorMessage);
}
