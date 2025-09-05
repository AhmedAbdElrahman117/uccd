import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo_impl.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';

class MyCoursesCubit extends Cubit<MyCoursesStates> {
  MyCoursesCubit() : super(InitialState()) {
    getCourses();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final UserCoursesRepoImpl repo = UserCoursesRepoImpl();

  void getCourses() {
    emit(DataLoading());
    repo.getUserCourse().listen(
      (data) {
        if (data.isNotEmpty) {
          repo.getCourses(data: data).listen(
            (courses) {
              emit(
                DataLoaded(data: courses),
              );
            },
            onError: (error) => emit(
              DataFailed(errorMessage: error.toString()),
            ),
          );
        } else {
          emit(DataEmpty());
        }
      },
      onError: (error) => emit(
        DataFailed(errorMessage: error.toString()),
      ),
    );
  }
}
