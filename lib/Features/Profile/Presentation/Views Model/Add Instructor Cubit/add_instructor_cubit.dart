import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Data/admin_instructors_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Instructor%20Cubit/add_instructor_states.dart';

class AddInstructorCubit extends Cubit<AddInstructorStates> {
  AddInstructorCubit() : super(InitialState());

  final AdminInstructorsRepo repo = AdminInstructorsRepo();

  void add({required UserModel instructor}) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.addInstructor(instructor: instructor);

      emit(
        AddUpdateSuccess(
          successMessage: message,
        ),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }

  void update({
    required UserModel newInstructor,
    required UserModel currentInstructor,
  }) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.updateInstructor(
        newInstructor: newInstructor,
        currentInstructor: currentInstructor,
      );

      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
