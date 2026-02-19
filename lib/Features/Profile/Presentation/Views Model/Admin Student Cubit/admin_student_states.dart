import 'package:uccd/Core/Models/user_model.dart';

sealed class AdminStudentStates {}

class AddStudentInitialState extends AdminStudentStates {}

class Loading extends AdminStudentStates {}

class DataFailed extends AdminStudentStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoading extends AdminStudentStates {}

class DataLoaded extends AdminStudentStates {
  final List<UserModel> users;

  DataLoaded({required this.users});
}

class DataEmpty extends AdminStudentStates {}

class DeleteFailed extends AdminStudentStates {
  final String errorMessage;

  DeleteFailed({required this.errorMessage});
}

class DeleteSuccess extends AdminStudentStates {
  final String successMessage;

  DeleteSuccess({required this.successMessage});
}
