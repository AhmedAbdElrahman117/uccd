import 'package:uccd/Core/Models/course_model.dart';

abstract class UserCoursesRepo {
  Stream<List<Map<CourseModel, bool?>>> getCourses(
      {required Map<String, dynamic> data});

  Stream<Map<String, dynamic>> getUserCourse();
}
