import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo_impl.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/user_course_states.dart';

class UserCourseCubit extends Cubit<UserCourseStates> {
  UserCourseCubit() : super(UserCourseInitialStates());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final UserCoursesRepoImpl repo = UserCoursesRepoImpl();

  void register(
      {required CourseModel course, required StudentModel student}) async {
    await firestore
        .collection('courses')
        .doc(course.courseID)
        .collection('students')
        .doc(student.studentID)
        .set(
          student.toMap(),
        )
        .then(
      (value) async {
        await firestore
            .collection('users')
            .doc(student.studentID)
            .collection('courses')
            .doc(course.courseID)
            .set(
          {
            'isAccepted': null,
            'id': course.courseID,
          },
        );
        await firestore.collection('courses').doc(course.courseID).update(
          {
            'currentStudents': FieldValue.increment(1),
          },
        );
        await firestore.collection('users').doc(student.studentID).update(
          {
            'enrolledCategories': FieldValue.arrayUnion([course.categoryID]),
            'isEnrolled': true,
          },
        );
      },
    );
  }
}
