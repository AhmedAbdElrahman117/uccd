import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Features/Admin/Courses/Data/admin_certificate_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Admin%20Certificate%20Cubit/admin_certfifcate_states.dart';

class AdminCertificateCubit extends Cubit<AdminCertfifcateStates> {
  AdminCertificateCubit({required this.courseID})
      : super(AdminCertificateInitialState()) {
    getAcceptedStudents();
  }

  final String courseID;

  AdminCertificateRepo repo = AdminCertificateRepo();

  void getAcceptedStudents() {
    emit(DataLoading());
    repo.getAcceptedStudents(courseID: courseID).listen(
          (students) => students.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(acceptedStudents: students),
                ),
          onError: (error) => emit(
            DataFailed(errorMessage: error.toString()),
          ),
        );
  }

  Future<void> notifyStudent({required StudentModel student}) async {
    emit(DataNotifying());
    try {
      await repo.notifyStudent(
        student: student,
      );
      emit(DataNotified());
    } catch (e) {
      emit(
        DataNotifyFailed(errorMessage: e.toString()),
      );
    }
  }

  Future<void> notifyStudents({required List<StudentModel> student}) async {
    emit(DataNotifying());
    try {
      await repo.notifyStudents(
        student: student,
      );
      emit(DataNotified());
    } catch (e) {
      emit(
        DataNotifyFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
