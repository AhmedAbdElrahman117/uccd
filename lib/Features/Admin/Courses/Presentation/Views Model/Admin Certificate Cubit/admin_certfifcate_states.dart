import 'package:uccd/Core/Models/student_model.dart';

sealed class AdminCertfifcateStates {}

class AdminCertificateInitialState extends AdminCertfifcateStates {}

class DataLoading extends AdminCertfifcateStates {}

class DataEmpty extends AdminCertfifcateStates {}

class DataFailed extends AdminCertfifcateStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends AdminCertfifcateStates {
  final List<StudentModel> acceptedStudents;

  DataLoaded({required this.acceptedStudents});
}

class DataNotifying extends AdminCertfifcateStates {}

class DataNotified extends AdminCertfifcateStates {}

class DataNotifyFailed extends AdminCertfifcateStates {
  final String errorMessage;

  DataNotifyFailed({required this.errorMessage});
}
