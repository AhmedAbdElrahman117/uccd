import 'package:uccd/Core/Models/enrolled_courses_model.dart';

sealed class MyCoursesStates {}

class InitialState extends MyCoursesStates {}

class DataFailed extends MyCoursesStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoading extends MyCoursesStates {}

class DataLoaded extends MyCoursesStates {
  final List<EnrolledCoursesModel> data;

  DataLoaded({required this.data});
}

class DataEmpty extends MyCoursesStates {}
