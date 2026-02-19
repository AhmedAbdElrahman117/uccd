import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/student_model.dart';

class AdminCertificateRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<StudentModel>> getAcceptedStudents({required String courseID}) {
    return _firestore
        .collection('courses')
        .doc(courseID)
        .collection('students')
        .where(
          'isAccepted',
          isEqualTo: true,
        )
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
          throw (error.code);
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
