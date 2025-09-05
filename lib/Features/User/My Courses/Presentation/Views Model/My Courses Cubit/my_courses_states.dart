import 'package:uccd/Core/Models/course_model.dart';

sealed class MyCoursesStates {}

class InitialState extends MyCoursesStates {}

class DataFailed extends MyCoursesStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoading extends MyCoursesStates {}

class DataLoaded extends MyCoursesStates {
  final List<Map<CourseModel, bool?>> data;

  DataLoaded({required this.data});
}

class DataEmpty extends MyCoursesStates {}
