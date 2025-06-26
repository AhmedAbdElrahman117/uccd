import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Data/admin_category_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Category%20Cubit/add_category_states.dart';

class AddCategoryCubit extends Cubit<AddCategoryStates> {
  AddCategoryCubit() : super(AddCategoryInitialState());

  final AdminCategoryRepo repo = AdminCategoryRepo();

  void add({required CategoryModel category}) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.addCategory(category: category);

      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }

  void update({required CategoryModel category}) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.updateCategory(category: category);

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
