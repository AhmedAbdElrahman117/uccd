import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Data/archive_course_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Archive%20Course%20Cubit/archive_course_states.dart';

class ArchiveCourseCubit extends Cubit<ArchiveCourseStates> {
  ArchiveCourseCubit() : super(ArchiveCourseInitialState()) {
    getArchiveCourses();
  }

  ArchiveCourseRepo repo = ArchiveCourseRepo();

  StreamSubscription? _subscription;

  void getArchiveCourses() {
    emit(DataLoading());
    _subscription = repo.getArchiveCourses().listen((courses) {
      courses.isEmpty
          ? emit(DataEmpty())
          : emit(
              DataLoaded(
                archiveCourses: courses,
              ),
            );
    }, onError: (error) {
      log(error.toString());
      emit(
        DataFailed(errorMessage: error.toString()),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
