import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo.dart';
import 'package:uccd/main.dart';

class UserCoursesRepoImpl extends UserCoursesRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Map<CourseModel, bool?>>> getCourses(
      {required Map<String, dynamic> data}) {
    return _firestore
        .collection('courses')
        .where(
          'courseID',
          whereIn: data.keys.toList(),
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('No Internet Connection');
        } else if (error is FirebaseException) {
          throw (error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.indexed.map(
          (e) {
            return {
              CourseModel.formJson(snapshot.docs[e.$1].data()):
                  data.values.elementAt(e.$1) as bool?,
            };
          },
        ).toList();
      },
    );
  }

  @override
  Stream<Map<String, dynamic>> getUserCourse() {
    return _firestore
        .collection('users')
        .doc(InternalStorage.getString('id'))
        .collection('courses')
        .snapshots()
        .handleError(
      (error) {
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
      },
    ).map(
      (value) {
        Map<String, dynamic> studentCourses = {};
        List.generate(
          value.docs.length,
          (index) {
            studentCourses[value.docs[index].get('id')] =
                value.docs[index].get('isAccepted');
          },
        );
        return studentCourses;
      },
    );
  }
}
