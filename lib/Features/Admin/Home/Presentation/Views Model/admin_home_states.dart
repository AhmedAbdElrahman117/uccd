import 'package:uccd/Core/Models/dashboard_model.dart';

sealed class AdminHomeStates {}

class AdminHomeInitialState extends AdminHomeStates {}

class AdminHomeLoading extends AdminHomeStates {}

class AdminHomeLoaded extends AdminHomeStates {
  final DashboardModel stats;

  AdminHomeLoaded({required this.stats});
}

class AdminHomeFailed extends AdminHomeStates {
  final String errorMessage;

  AdminHomeFailed({required this.errorMessage});
}
