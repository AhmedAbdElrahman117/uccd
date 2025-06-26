import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/main.dart';

class UserHomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getCourses() {
    return _firestore
        .collection('courses')
        .orderBy(
          'interviewEndDate',
          descending: true,
        )
        .where(
          'interviewStartDate',
          isGreaterThan: Timestamp.now(),
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs
            .where(
              (course) =>
                  course.get('currentStudents') !=
                  course.get('maxAcceptedStudents'),
            )
            .map(
              (course) => CourseModel.formJson(
                course.data(),
              ),
            )
            .toList();
      },
    ).distinct();
  }

  Stream<String> enrollmentStatus(CourseModel course) {
    return _firestore
        .collection('users')
        .doc(InternalStorage.getString('id'))
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else if (error is TimeoutException) {
          throw ('connectionTimeout');
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        List<dynamic> enrolledCategories = snapshot.get('enrolledCategories');
        if (enrolledCategories.contains(course.categoryID)) {
          return 'enrolledInThisCategory';
        } else if (course.maxAcceptedStudents == course.currentStudents) {
          return 'courseFull';
        } else {
          return 'enrollNow';
        }
      },
    );
  }

  Future<UserModel> getUserInfo() async {
    try {
      var doc = await _firestore
          .collection('users')
          .doc(InternalStorage.getString('id'))
          .withConverter(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toStudentMap(value.id!),
          )
          .get();

      if (doc.exists) {
        return doc.data()!;
      } else {
        throw ("noUser");
      }
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (error) {
      throw (error.message ?? error.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<void> registerInCourse(
      {required String courseID, required String categoryID}) async {
    try {
      UserModel user = await getUserInfo();
      await _firestore
          .collection('courses')
          .doc(courseID)
          .collection('students')
          .doc(
            InternalStorage.getString('id'),
          )
          .set(
            StudentModel.fromUser(user).toMap(),
          );

      await _firestore
          .collection('users')
          .doc(InternalStorage.getString('id'))
          .update(
        {
          'isEnrolled': true,
          'enrolledCategories': FieldValue.arrayUnion([categoryID]),
        },
      );

      await _firestore
          .collection('users')
          .doc(InternalStorage.getString('id'))
          .collection('courses')
          .doc(courseID)
          .set(
        {
          'id': courseID,
          'isAccepted': null,
        },
      );

      await _firestore.collection('courses').doc(courseID).update(
        {
          'currentStudents': FieldValue.increment(1),
        },
      );
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (error) {
      throw (error.message ?? error.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
