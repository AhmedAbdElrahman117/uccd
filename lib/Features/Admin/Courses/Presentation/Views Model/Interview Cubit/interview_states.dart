import 'package:uccd/Core/Models/student_model.dart';

sealed class InterviewStates {}

class InterviewInitialState extends InterviewStates {}

class DataLoading extends InterviewStates {}

class DataEmpty extends InterviewStates {}

class DataLoaded extends InterviewStates {
  final List<StudentModel> students;

  DataLoaded({required this.students});
}

class DataFailed extends InterviewStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class InterviewLoading extends InterviewStates {}

class InterviewSuccess extends InterviewStates {}

class InterviewFailed extends InterviewStates {
  final String errorMessage;

  InterviewFailed({required this.errorMessage});
}
