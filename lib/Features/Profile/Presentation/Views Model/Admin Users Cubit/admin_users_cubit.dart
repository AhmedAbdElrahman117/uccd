import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Data/admin_users_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Users%20Cubit/admin_users_states.dart';

class AdminUsersCubit extends Cubit<AdminUsersStates> {
  AdminUsersCubit() : super(AdminUsersInitialState());

  AdminUsersRepo repo = AdminUsersRepo();
  StreamSubscription? studentsSubscription;
  StreamSubscription? instructorsSubscription;
  StreamSubscription? adminsSubscription;

  void getAdmins() {
    emit(AdminDataLoading());

    adminsSubscription = repo.getAdmins().listen(
          (admins) => admins.isEmpty
              ? emit(AdminDataEmpty())
              : emit(
                  AdminDataLoaded(admins: admins),
                ),
          onError: (error) => emit(
            AdminDataFailed(errorMessage: error.toString()),
          ),
        );
  }

  void getInstructors() {
    emit(InstructorDataLoading());
    instructorsSubscription = repo.getInstructors().listen(
          (instructors) => instructors.isEmpty
              ? emit(InstructorDataEmpty())
              : emit(
                  InstructorDataLoaded(instructors: instructors),
                ),
          onError: (error) => emit(
            InstructorDataFailed(errorMessage: error.toString()),
          ),
        );
  }

  void getStudent() async {
    emit(StudentDataLoading());
    studentsSubscription = repo.getStudents().listen(
          (students) => students.isEmpty
              ? emit(StudentDataEmpty())
              : emit(
                  StudentDataLoaded(students: students),
                ),
          onError: (error) => emit(
            StudentDataFailed(errorMessage: error.toString()),
          ),
        );
  }

  void deleteUser({required UserModel user}) async {
    emit(DeleteLoading());
    try {
      await repo.deleteUser(user: user);
      user.role == 'Admin'
          ? emit(
              AdminDeleteSuccess(successMessage: 'Admin Deleted Successfully'),
            )
          : user.role == 'Instructor'
              ? emit(
                  InstrcutorDeleteSuccess(
                      successMessage: 'Instructor Deleted Successfully'),
                )
              : emit(
                  StudentDeleteSuccess(
                      successMessage: 'Student Deleted Successfully'),
                );
    } catch (e) {
      user.role == 'Admin'
          ? emit(
              AdminDeleteFailed(errorMessage: e.toString()),
            )
          : user.role == 'Instructor'
              ? emit(
                  InstrcutorDeleteFailed(errorMessage: e.toString()),
                )
              : emit(
                  StudentDeleteFailed(errorMessage: e.toString()),
                );
    }
  }

  @override
  Future<void> close() {
    studentsSubscription?.cancel();
    instructorsSubscription?.cancel();
    adminsSubscription?.cancel();
    return super.close();
  }
}

// void addUser({
//   required UserModel user,
// }) async {
//   emit(AddAdminLoading());
//   try {
//     await repo.addUser(
//       user: user,
//     );
//     emit(AddAdminSuccess());
//   } catch (e) {
//     emit(AddAdminFailed(e.toString()));
//   }
// }

  // void updateUser({
  //   required UserModel currentUser,
  //   required UserModel newUser,
  // }) async {
  //   emit(AddAdminLoading());
  //   try {
  //     await repo.updateUser(
  //       currentUser: currentUser,
  //       newUser: newUser,
  //     );
  //     emit(AddAdminSuccess());
  //   } catch (e) {
  //     emit(AddAdminFailed(e.toString()));
  //   }
  // }