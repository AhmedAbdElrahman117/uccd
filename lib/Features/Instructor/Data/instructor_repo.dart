import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/main.dart';

class InstructorRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getInstructorCourses() {
    return _firestore
        .collection('courses')
        .where(
          'instructorId',
          isEqualTo: InternalStorage.getString('id'),
        )
        .where(
          'courseEndDate',
          isGreaterThanOrEqualTo: Timestamp.now(),
        )
        .orderBy(
          'courseStartDate',
          descending: true,
        )
        .withConverter(
          fromFirestore: (snapshot, options) => CourseModel.formJson(
            snapshot.data()!,
          ),
          toFirestore: (course, options) => course.toMap(),
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
          (doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

  Stream<List<StudentModel>> getCourseStudents(String courseId) {
    return _firestore
        .collection('courses')
        .doc(courseId)
        .collection('students')
        .where(
          'isAccepted',
          isEqualTo: true,
        )
        .orderBy(
          'name',
          descending: false,
        )
        .withConverter(
          fromFirestore: (snapshot, options) => StudentModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (student, options) => student.toMap(),
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
          (doc) {
            bool? stat;
            if (doc.data().absenceDates != null &&
                doc.data().attendanceDates != null) {
              for (int i = 0; i < doc.data().absenceDates!.length; i++) {
                if (AppDates.timeStampToString(Timestamp.now()) ==
                    AppDates.timeStampToString(doc.data().absenceDates![i])) {
                  stat = false;
                  break;
                }
              }

              if (stat == null) {
                for (int i = 0; i < doc.data().attendanceDates!.length; i++) {
                  if (AppDates.timeStampToString(Timestamp.now()) ==
                      AppDates.timeStampToString(
                          doc.data().attendanceDates![i])) {
                    stat = true;
                    break;
                  }
                }
              }
            }
            return doc.data()..isAttended = stat;
          },
        ).toList();
      },
    );
  }

  Future<void> studentPresent({
    required String courseID,
    required String studentID,
    required Timestamp date,
  }) async {
    var student = await _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .doc(studentID)
        .withConverter(
          fromFirestore: (snapshot, options) => StudentModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();
    if (student.data() != null && student.data()!.absenceDates != null) {
      if (student.data()!.absenceDates!.contains(date)) {
        await _firestore
            .collection('courses')
            .doc(courseID)
            .collection('students')
            .doc(studentID)
            .update(
          {
            'absenceDates': FieldValue.arrayRemove([date]),
          },
        );
      }
    }
    await _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .doc(studentID)
        .update(
      {
        'attendanceDates': FieldValue.arrayUnion([date]),
      },
    );
  }

  Future<void> studentAbsent({
    required String courseID,
    required String studentID,
    required Timestamp date,
  }) async {
    var student = await _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .doc(studentID)
        .withConverter(
          fromFirestore: (snapshot, options) => StudentModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();

    if (student.data() != null && student.data()!.attendanceDates != null) {
      if (student.data()!.attendanceDates!.contains(date)) {
        await _firestore
            .collection('courses')
            .doc(courseID)
            .collection('students')
            .doc(studentID)
            .update(
          {
            'attendanceDates': FieldValue.arrayRemove([date]),
          },
        );
      }
    }
    await _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .doc(studentID)
        .update(
      {
        'absenceDates': FieldValue.arrayUnion([date]),
      },
    );
  }

  Future<void> unmarkStudentAttendance({
    required String courseID,
    required String studentID,
    required Timestamp date,
  }) async {
    // Remove the date from both attendance and absence arrays
    await _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .doc(studentID)
        .update({
      'attendanceDates': FieldValue.arrayRemove([date]),
      'absenceDates': FieldValue.arrayRemove([date]),
    });
  }

  Future<void> uploadMaterial() async {}
}
