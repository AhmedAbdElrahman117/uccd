import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Data/admin_category_repo.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Category%20Cubit/admin_category_states.dart';

class AdminCategoryCubit extends Cubit<AdminCategoryStates> {
  AdminCategoryCubit() : super(CategoryInitialState()) {
    getCategories();
  }

  final AdminCategoryRepo repo = AdminCategoryRepo();
  StreamSubscription? subscription;

  void getCategories() {
    emit(DataLoading());
    subscription = repo.getCategories().listen(
      (categories) {
        if (categories.isEmpty) {
          emit(DataEmpty());
        } else {
          emit(
            DataLoaded(categories: categories),
          );
        }
      },
      onError: (error) => emit(
        DataFailed(errorMessage: error),
      ),
    );
  }

  void delete({required CategoryModel category}) async {
    emit(DeleteLoading());
    try {
      String message = await repo.deleteCategory(
        category: category,
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
