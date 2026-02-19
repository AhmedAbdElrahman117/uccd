import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Profile/Data/admin_instructors_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Instructor%20Cubit/admin_instructor_states.dart';

class AdminInstructorCubit extends Cubit<AdminInstructorStates> {
  AdminInstructorCubit() : super(InstructorInitialState()) {
    getInstructors();
  }

  final AdminInstructorsRepo repo = AdminInstructorsRepo();
  StreamSubscription? subscription;

  void getInstructors() async {
    emit(DataLoading());
    subscription = repo.getInstructors().listen(
      (data) {
        if (data.isEmpty) {
          emit(DataEmpty());
        } else {
          emit(DataLoaded(instructors: data));
        }
      },
      onError: (error) {
        emit(
          DataFailed(errorMessage: error.toString()),
        );
      },
    );
  }

  void delete({
    required String email,
    required String password,
    required String id,
  }) async {
    emit(DeleteLoading());
    try {
      String message = await repo.deleteInstructor(
        email: email,
        password: password,
        id: id,
      );
      emit(
        DeleteSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        DeleteFailed(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    subscription = null;
    return super.close();
  }
}
