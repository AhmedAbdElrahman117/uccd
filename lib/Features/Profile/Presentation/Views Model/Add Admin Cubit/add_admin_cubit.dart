import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Data/admin_users_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Admin%20Cubit/add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminCubitInitial());

  final AdminUsersRepo _adminUsersRepo = AdminUsersRepo();

  void addAdmin({
    required UserModel user,
  }) async {
    emit(AddAdminLoading());
    try {
      await _adminUsersRepo.addUser(
        user: user,
      );
      emit(AddAdminSuccess());
    } catch (e) {
      emit(AddAdminFailed(e.toString()));
    }
  }

  void updateAdmin({
    required UserModel currentUser,
    required UserModel newUser,
  }) async {
    emit(AddAdminLoading());
    try {
      await _adminUsersRepo.updateUser(
        currentUser: currentUser,
        newUser: newUser,
      );
      emit(AddAdminSuccess());
    } catch (e) {
      emit(AddAdminFailed(e.toString()));
    }
  }

  void add({
    required bool isAdd,
    required String name,
    required String email,
    required String password,
    UserModel? currentUser,
  }) {
    if (isAdd) {
      addAdmin(
        user: UserModel(
          name: name,
          email: email,
          password: password,
          role: 'Admin',
        ),
      );
    } else {
      updateAdmin(
        currentUser: currentUser!,
        newUser: UserModel(
          name: name,
          email: email,
          password: password,
          role: 'Admin',
        ),
      );
    }
  }
}
