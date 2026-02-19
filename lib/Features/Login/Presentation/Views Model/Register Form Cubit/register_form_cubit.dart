import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Login/Data/registeration_form_repo.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';

class RegisterFormCubit extends Cubit<RegisterFormStates> {
  RegisterFormCubit() : super(RegisterFormInitialState());

  int current = 0;
  RegisterationFormRepo repo = RegisterationFormRepo();
  bool isAgree = false;

  List<String> selectedCategories = [];

  void getCategories() async {
    emit(DataLoading());
    await repo.getCategories().then(
          (categories) => categories.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(categories: categories),
                ),
          onError: (error) => emit(
            DataFailed(errorMessage: error.toString()),
          ),
        );
  }

  void nextPage(
      PageController pageController, GlobalKey<FormState> formKey) async {
    if (current == 0 && !formKey.currentState!.validate()) {
    } else {
      await pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      if (current < 2) {
        current++;
      }
      emit(ChangePage());
    }
  }

  void previousPage(PageController pageController) async {
    await pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    current--;
    emit(ChangePage());
  }

  void triggerAgree() {
    isAgree = !isAgree;
    emit(TermsAgreed());
  }

  bool isSelected(String id) {
    return selectedCategories.contains(id);
  }

  void triggerSelection(String id) {
    if (isSelected(id)) {
      selectedCategories.remove(id);
    } else {
      selectedCategories.add(id);
    }

    emit(TriggerSelection());
  }

  void register({
    required String id,
    required String phone,
    required Timestamp graduationYear,
    required String disability,
  }) async {
    emit(RegisterLoading());
    try {
      await repo
          .registerData(
            id: id,
            phone: phone,
            graduationYear: graduationYear,
            disability: disability,
            selectedCategories: selectedCategories,
            agree: isAgree,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      emit(RegisterSuccess());
    } catch (e) {
      emit(
        RegisterFailed(
          id: id,
          phone: phone,
          graduationYear: graduationYear,
          disability: disability,
          selectedCategories: selectedCategories,
          isAgree: isAgree,
        ),
      );
    }
  }
}
