import 'package:uccd/Core/Models/log_model.dart';

sealed class AdminLogsStates {}

class AdminLogsInitialState extends AdminLogsStates {}

class DataLoading extends AdminLogsStates {}

class DataEmpty extends AdminLogsStates {}

class DataLoaded extends AdminLogsStates {
  final List<LogModel> logs;

  DataLoaded({required this.logs});
}

class DataFailed extends AdminLogsStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class ChangeDate extends AdminLogsStates {}
