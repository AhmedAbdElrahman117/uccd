import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/enrolled_courses_model.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo.dart';
import 'package:uccd/main.dart';

class UserCoursesRepoImpl extends UserCoursesRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<EnrolledCoursesModel>> getCourses({
    required Map<String, dynamic> data,
  }) {
    return _firestore
        .collection('courses')
        .where('courseID', whereIn: data.keys.toList())
        .snapshots()
        .handleError((error) {
          if (error is SocketException) {
            throw ('No Internet Connection');
          } else if (error is FirebaseException) {
            throw (error.code);
          } else {
            throw (error.toString());
          }
        })
        .asyncMap((snapshot) async {
          List<EnrolledCoursesModel> enrolledCourses = [];

          for (var i = 0; i < snapshot.docs.length; i++) {
            final courseData = snapshot.docs[i].data();
            final course = CourseModel.formJson(courseData);
            final courseId = snapshot.docs[i].id;
            final status = data[courseId] as bool?;

            // Calculate progress
            double progress = 0.0;
            String progressText = '0%';
            bool? isRated;

            if (status == true) {
              // Get progress from user's course subcollection
              try {
                final userCourseDoc = await _firestore
                    .collection('users')
                    .doc(InternalStorage.getString('id'))
                    .collection('courses')
                    .doc(courseId)
                    .get();

                if (userCourseDoc.exists) {
                  final data = userCourseDoc.data();
                  progress = (data?['progress'] ?? 0.0).toDouble();
                  progressText = '${(progress * 100).toStringAsFixed(0)}%';
                  isRated = data?['isRated'] as bool?;
                }
              } catch (e) {
                log('Error getting progress: $e');
              }
            }

            enrolledCourses.add(
              EnrolledCoursesModel(
                course: course,
                status: status,
                progress: progress,
                progressText: progressText,
                isRated: isRated,
              ),
            );
          }

          return enrolledCourses;
        });
  }

  @override
  Stream<Map<String, dynamic>> getUserCourse() {
    return _firestore
        .collection('users')
        .doc(InternalStorage.getString('id'))
        .collection('courses')
        .snapshots()
        .handleError((error) {
          if (error is SocketException) {
            log('1');
            throw ('No Internet Connection');
          } else if (error is FirebaseException) {
            log('2');
            throw (error.code);
          } else {
            log('3');
            throw (error.toString());
          }
        })
        .map((value) {
          Map<String, dynamic> studentCourses = {};
          List.generate(value.docs.length, (index) {
            studentCourses[value.docs[index].get('id')] = value.docs[index].get(
              'isAccepted',
            );
          });
          return studentCourses;
        });
  }
}
