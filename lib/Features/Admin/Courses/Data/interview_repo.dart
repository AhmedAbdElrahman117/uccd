import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/notification_api.dart';
import 'package:uccd/main.dart';

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
          throw ('noInternetConnection');
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

  Future<void> acceptStudent({
    required CourseModel course,
    required StudentModel student,
  }) async {
    try {
      await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .doc(student.studentID)
          .update(
        {
          'isAccepted': true,
        },
      );

      await _firestore.collection('users').doc(student.studentID).update(
        {
          'isEnrolled': true,
          'enrolledCategories': FieldValue.arrayUnion(
            [course.categoryID],
          )
        },
      );
      await _firestore
          .collection('users')
          .doc(student.studentID)
          .collection('courses')
          .doc(course.courseID)
          .update(
        {'isAccepted': true},
      );

      var ref = await _firestore
          .collection('users')
          .doc(student.studentID)
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
            .doc(student.studentID)
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

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Accepted Student ${student.name} in Course ${course.title}',
        actionType: 'Accept',
        createdAt: Timestamp.now(),
      );

      await _firestore.collection('logs').add(
            log.toMap(),
          );

      if (student.notificationID != null) {
        await FCMAPI.sendToToken(
          deviceToken: student.notificationID!,
          body:
              'You have been accepted in the course ${course.title}.\n Welcome to UCCD Family!',
          title: 'Congratulations!',
        );
      }
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<void> rejectStudent({
    required CourseModel course,
    required StudentModel student,
  }) async {
    try {
      await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .doc(student.studentID)
          .update(
        {
          'isAccepted': false,
        },
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Rejected Student ${student.name} From Course ${course.title}',
        actionType: 'Reject',
        createdAt: Timestamp.now(),
      );

      await _firestore.collection('logs').add(
            log.toMap(),
          );

      if (student.notificationID != null) {
        await FCMAPI.sendToToken(
          deviceToken: student.notificationID!,
          body:
              'You have been Rejected From course ${course.title}.\n We hope to see you in the future.',
          title: 'Rejected',
        );
      }
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
