sealed class StatisticsStates {}

class StatisticsInitialState extends StatisticsStates {}

class DataLoading extends StatisticsStates {}

class DataLoaded extends StatisticsStates {
  final Map<String, dynamic> statistics;

  DataLoaded({required this.statistics});
}

class DataFailed extends StatisticsStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}
