import 'package:uccd/Core/Models/course_model.dart';

sealed class AvailableCourseStates {}

class AvailableCourseInitialState extends AvailableCourseStates {}

class DataLoading extends AvailableCourseStates {}

class DataLoaded extends AvailableCourseStates {
  final List<CourseModel> courses;

  DataLoaded({required this.courses});
}

class DataFailed extends AvailableCourseStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataEmpty extends AvailableCourseStates {}

class DeleteSuccess extends AvailableCourseStates {
  final String successMessage;

  DeleteSuccess({required this.successMessage});
}

class DeleteFailed extends AvailableCourseStates {
  final String errorMessage;

  DeleteFailed({required this.errorMessage});
}

class DeleteLoading extends AvailableCourseStates {}
