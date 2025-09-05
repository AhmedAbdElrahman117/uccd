import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';

class InterviewRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<StudentModel>> getInterviewStudents({required String courseID}) {
    return _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .orderBy('isAccepted')
        .withConverter(
          fromFirestore: (snapshot, options) => StudentModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('No Internet Connection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.map(
          (e) {
            return e.data();
          },
        ).toList();
      },
    ).distinct();
  }

  Future<void> acceptStudent(
      {required CourseModel course, required String studentID}) async {
    try {
      await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .doc(studentID)
          .update(
        {
          'isAccepted': true,
        },
      );

      await _firestore.collection('users').doc(studentID).update(
        {
          'isEnrolled': true,
          'enrolledCategories': FieldValue.arrayUnion(
            [course.categoryID],
          )
        },
      );
      await _firestore
          .collection('users')
          .doc(studentID)
          .collection('courses')
          .doc(course.courseID)
          .update(
        {'isAccepted': true},
      );

      var ref = await _firestore
          .collection('users')
          .doc(studentID)
          .collection('courses')
          .where('isAccepted', isNull: true)
          .where('id', isNotEqualTo: course.courseID)
          .orderBy('id')
          .orderBy('isAccepted')
          .get();

      List<DocumentSnapshot<Map<String, dynamic>>> enrolledCourses = [];

      for (int i = 0; i < ref.docs.length; i++) {
        var x = await _firestore
            .collection('courses')
            .doc(ref.docs[i].get('id'))
            .collection('students')
            .doc(studentID)
            .get();
        enrolledCourses.add(x);
      }

      await _firestore.runTransaction(
        (transaction) async {
          for (int i = 0; i < ref.docs.length; i++) {
            transaction.update(ref.docs[i].reference, {
              'isAccepted': false,
            });
            transaction.update(
              enrolledCourses[i].reference,
              {
                'isAccepted': false,
              },
            );
          }
        },
      );
    } on TimeoutException {
      throw ('Connection Timeout');
    } on SocketException {
      throw ('No Internet Connection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<void> rejectStudent(
      {required CourseModel course, required String studentID}) async {
    try {
      await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .doc(studentID)
          .update(
        {
          'isAccepted': false,
        },
      );
    } on TimeoutException {
      throw ('Connection Timeout');
    } on SocketException {
      throw ('No Internet Connection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
