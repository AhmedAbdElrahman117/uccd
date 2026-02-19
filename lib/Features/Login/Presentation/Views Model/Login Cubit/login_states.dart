import 'package:uccd/Core/Models/user_model.dart';

class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginFailed extends LoginStates {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
}

class LoginLoading extends LoginStates {}

class SuperAdmin extends LoginStates {}

class AdminRole extends LoginStates {}

class InstructorRole extends LoginStates {}

class StudentRole extends LoginStates {
  final UserModel user;

  StudentRole(this.user);
}

class SuperAdminRole extends LoginStates {}
