import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Data/statistics_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Statistics%20Cubit/statistics_states.dart';

class StatisticsCubit extends Cubit<StatisticsStates> {
  StatisticsCubit({required this.courseID}) : super(StatisticsInitialState()) {
    getStats();
  }

  final StatisticsRepo repo = StatisticsRepo();
  final String courseID;

  void getStats() {
    emit(DataLoading());
    repo.getStatistics(courseID: courseID).then(
      (value) {
        emit(DataLoaded(statistics: value));
      },
      onError: (error) => emit(
        DataFailed(errorMessage: error.toString()),
      ),
    );
  }
}
