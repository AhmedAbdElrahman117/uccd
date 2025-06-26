import 'package:uccd/Core/Models/user_model.dart';

sealed class AdminUsersStates {}

class AdminUsersInitialState extends AdminUsersStates {}

class AdminDataLoading extends AdminUsersStates {}

class AdminDataEmpty extends AdminUsersStates {}

class AdminDataLoaded extends AdminUsersStates {
  final List<UserModel> admins;

  AdminDataLoaded({required this.admins});
}

class AdminDataFailed extends AdminUsersStates {
  final String errorMessage;

  AdminDataFailed({required this.errorMessage});
}

class InstructorDataLoading extends AdminUsersStates {}

class InstructorDataEmpty extends AdminUsersStates {}

class InstructorDataLoaded extends AdminUsersStates {
  final List<UserModel> instructors;

  InstructorDataLoaded({required this.instructors});
}

class InstructorDataFailed extends AdminUsersStates {
  final String errorMessage;

  InstructorDataFailed({required this.errorMessage});
}

class StudentDataLoading extends AdminUsersStates {}

class StudentDataEmpty extends AdminUsersStates {}

class StudentDataLoaded extends AdminUsersStates {
  final List<UserModel> students;

  StudentDataLoaded({required this.students});
}

class StudentDataFailed extends AdminUsersStates {
  final String errorMessage;

  StudentDataFailed({required this.errorMessage});
}

class DeleteLoading extends AdminUsersStates {}

class InstrcutorDeleteSuccess extends AdminUsersStates {
  final String successMessage;

  InstrcutorDeleteSuccess({required this.successMessage});
}

class InstrcutorDeleteFailed extends AdminUsersStates {
  final String errorMessage;

  InstrcutorDeleteFailed({required this.errorMessage});
}

class StudentDeleteSuccess extends AdminUsersStates {
  final String successMessage;

  StudentDeleteSuccess({required this.successMessage});
}

class StudentDeleteFailed extends AdminUsersStates {
  final String errorMessage;

  StudentDeleteFailed({required this.errorMessage});
}

class AdminDeleteSuccess extends AdminUsersStates {
  final String successMessage;

  AdminDeleteSuccess({required this.successMessage});
}

class AdminDeleteFailed extends AdminUsersStates {
  final String errorMessage;

  AdminDeleteFailed({required this.errorMessage});
}
/////

// class AddAdminLoading extends AdminUsersStates {}

// class AddAdminSuccess extends AdminUsersStates {}

// class AddAdminFailed extends AdminUsersStates {
//   final String errorMessage;

//   AddAdminFailed(this.errorMessage);
// }
