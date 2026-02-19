import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Data/admin_studetns_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Student%20Cubit/add_student_states.dart';

class AddStudentCubit extends Cubit<AddStudentStates> {
  AddStudentCubit() : super(InitialState());

  final AdminStudetnsRepo repo = AdminStudetnsRepo();

  void add({required UserModel student}) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.addStudent(
        student: student,
      );
      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }

  void update({
    required UserModel currentStudent,
    required UserModel newStudent,
  }) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.updateStudent(
        currentStudent: currentStudent,
        newStudent: newStudent,
      );

      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }
}
