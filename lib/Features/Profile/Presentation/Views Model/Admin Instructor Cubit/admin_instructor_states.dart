import 'package:uccd/Core/Models/user_model.dart';

sealed class AdminInstructorStates {}

class InstructorInitialState extends AdminInstructorStates {}

class DataLoading extends AdminInstructorStates {}

class DataFailed extends AdminInstructorStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends AdminInstructorStates {
  final List<UserModel> instructors;

  DataLoaded({required this.instructors});
}

class DataEmpty extends AdminInstructorStates {}

class DeleteFailed extends AdminInstructorStates {
  final String errorMessage;

  DeleteFailed({required this.errorMessage});
}

class DeleteSuccess extends AdminInstructorStates {
  final String successMessage;

  DeleteSuccess({required this.successMessage});
}

class DeleteLoading extends AdminInstructorStates {}
