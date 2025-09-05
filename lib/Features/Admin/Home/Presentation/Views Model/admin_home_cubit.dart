import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views%20Model/admin_home_states.dart';

class AdminHomeCubit extends Cubit<AdminHomeStates> {
  AdminHomeCubit() : super(AdminHomeInitialState());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addCourse(CourseModel course) async {
    emit(AdminHomeLoadingState());
    try {
      await firestore.collection('courses').add(
            course.toMap(),
          );
      emit(AdminHomeSuccessState());
    } on Exception catch (e) {
      emit(AdminHomeFailedState());
      log('Add Course Error: ${e.toString()}');
    }
  }

  void addCategory(String category) async {
    emit(AdminHomeLoadingState());
    try {
      await firestore.collection('category').add(
        {'category': category},
      );
      emit(AdminHomeSuccessState());
    } on Exception catch (e) {
      emit(AdminHomeFailedState());
      log('Add Category Error: ${e.toString()}');
    }
  }
}
