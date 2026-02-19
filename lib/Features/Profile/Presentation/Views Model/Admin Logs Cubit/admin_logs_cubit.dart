import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Features/Profile/Data/admin_logs_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Logs%20Cubit/admin_logs_states.dart';

class AdminLogsCubit extends Cubit<AdminLogsStates> {
  AdminLogsCubit(this.currentTimestamp) : super(AdminLogsInitialState()) {
    getLogs();
  }

  Timestamp currentTimestamp;
  DateTime dateTime = DateTime.now();

  final AdminLogsRepo repo = AdminLogsRepo();

  void getLogs() async {
    emit(DataLoading());

    try {
      List<LogModel> logs = await repo.getLogs(currentTimestamp);
      logs.isEmpty
          ? emit(DataEmpty())
          : emit(
              DataLoaded(logs: logs),
            );
    } catch (e) {
      emit(
        DataFailed(errorMessage: e.toString()),
      );
    }
  }

  void changeDate(Timestamp timestamp) async {
    currentTimestamp = timestamp;
    dateTime = timestamp.toDate();
    emit(ChangeDate());
    getLogs();
  }
}
