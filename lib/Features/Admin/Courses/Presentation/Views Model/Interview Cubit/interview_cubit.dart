import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Features/Admin/Courses/Data/interview_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Interview%20Cubit/interview_states.dart';

class InterviewCubit extends Cubit<InterviewStates> {
  InterviewCubit({required this.courseID}) : super(InterviewInitialState()) {
    getInterviewStudents();
  }

  final String courseID;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final InterviewRepo repo = InterviewRepo();

  StreamSubscription? subscription;

  List<StudentModel> allStudents = [];

  void getInterviewStudents() {
    emit(DataLoading());
    subscription = repo.getInterviewStudents(courseID: courseID).listen(
      (students) {
        allStudents = students;
        students.isEmpty
            ? emit(DataEmpty())
            : emit(
                DataLoaded(students: students),
              );
      },
      onError: (error) => emit(
        DataFailed(
          errorMessage: error.toString(),
        ),
      ),
    );
  }

  void filter({required String filter}) {
    emit(DataLoading());
    try {
      if (allStudents.isNotEmpty) {
        if (filter == 'All') {
          emit(
            DataLoaded(students: allStudents),
          );
        } else if (filter == 'Pending') {
          var data = allStudents
              .where(
                (student) => student.isAccepted == null,
              )
              .toList();
          data.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(
                    students: data,
                  ),
                );
        } else if (filter == 'Accepted') {
          var data = allStudents
              .where(
                (student) => student.isAccepted == true,
              )
              .toList();
          data.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(
                    students: data,
                  ),
                );
        } else if (filter == 'Rejected') {
          var data = allStudents
              .where(
                (student) => student.isAccepted == false,
              )
              .toList();
          data.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(
                    students: data,
                  ),
                );
        }
      } else {
        emit(
          DataEmpty(),
        );
      }
    } catch (e) {
      emit(
        DataFailed(errorMessage: e.toString()),
      );
    }
  }

  void accept({
    required CourseModel course,
    required StudentModel student,
  }) async {
    emit(InterviewLoading());
    try {
      await repo.acceptStudent(
        course: course,
        student: student,
      );
      emit(InterviewSuccess());
    } catch (e) {
      emit(
        InterviewFailed(errorMessage: e.toString()),
      );
    }
  }

  void reject({
    required CourseModel course,
    required StudentModel student,
  }) async {
    emit(InterviewLoading());
    try {
      await repo.rejectStudent(
        course: course,
        student: student,
      );
      emit(InterviewSuccess());
    } catch (e) {
      emit(
        InterviewFailed(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() async {
    await subscription?.cancel();
    subscription = null;
    return super.close();
  }
}
