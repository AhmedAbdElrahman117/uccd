import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';

class ArchiveCourseRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getArchiveCourses() {
    return _firestore
        .collection('courses')
        .where(
          'courseEndDate',
          isLessThan: Timestamp.now(),
        )
        .orderBy('courseEndDate')
        .withConverter(
          fromFirestore: (snapshot, options) => CourseModel.formJson(
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
      (snapshot) => snapshot.docs
          .map(
            (e) => e.data(),
          )
          .toList(),
    );
  }
}
