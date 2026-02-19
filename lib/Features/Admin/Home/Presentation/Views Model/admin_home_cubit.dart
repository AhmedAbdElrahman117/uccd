import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uccd/Core/Models/dashboard_model.dart';
import 'package:uccd/Features/Admin/Home/Data/admin_home_repo.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views%20Model/admin_home_states.dart';

class AdminHomeCubit extends Cubit<AdminHomeStates> {
  AdminHomeCubit() : super(AdminHomeInitialState());

  AdminHomeRepo repo = AdminHomeRepo();

  StreamSubscription? _dashboardSubscription;
  void getStats() {
    emit(AdminHomeLoading());
    try {
      _dashboardSubscription = Rx.combineLatest5(
        repo.getTotalAdmins(),
        repo.getTotalCourses(),
        repo.getTotalCategories(),
        repo.getTotalInstructors(),
        repo.getTotalStudents(),
        (a, b, c, d, e) {
          return DashboardModel(
            totalAdmins: a,
            totalCourses: b,
            totalCategories: c,
            totalInstructors: d,
            activeStudents: e,
          );
        },
      ).listen(
        (dashboardModel) {
          emit(AdminHomeLoaded(stats: dashboardModel));
        },
      );
    } catch (e) {
      emit(
        AdminHomeFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _dashboardSubscription?.cancel();
    _dashboardSubscription = null;
    return super.close();
  }
}
