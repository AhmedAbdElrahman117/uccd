import 'package:uccd/Core/Models/enrolled_courses_model.dart';

abstract class UserCoursesRepo {
  Stream<List<EnrolledCoursesModel>> getCourses({
    required Map<String, dynamic> data,
  });

  Stream<Map<String, dynamic>> getUserCourse();
}
