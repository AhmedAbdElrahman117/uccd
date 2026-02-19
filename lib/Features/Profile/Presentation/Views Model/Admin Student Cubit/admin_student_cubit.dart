import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Profile/Data/admin_studetns_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Student%20Cubit/admin_student_states.dart';

class AdminStudentCubit extends Cubit<AdminStudentStates> {
  AdminStudentCubit() : super(AddStudentInitialState()) {
    getStudents();
  }

  final AdminStudetnsRepo repo = AdminStudetnsRepo();
  StreamSubscription? subscription;

  void getStudents() {
    emit(DataLoading());
    subscription = repo.getStudents().listen(
      (data) {
        if (data.isEmpty) {
          emit(
            DataEmpty(),
          );
        } else {
          emit(
            DataLoaded(users: data),
          );
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
    emit(Loading());
    try {
      String message = await repo.deleteStudent(
        email: email,
        id: id,
        password: password,
      );
      emit(
        DeleteSuccess(
          successMessage: message,
        ),
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
