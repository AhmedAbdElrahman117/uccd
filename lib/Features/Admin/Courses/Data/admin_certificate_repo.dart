import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/notification_api.dart';

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
          throw ('noInternetConnection');
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

  Future<void> notifyStudent({required StudentModel student}) async {
    try {
      if (student.notificationID != null) {
        await FCMAPI
            .sendToToken(
              deviceToken: student.notificationID!,
              title: 'Certificate Issued',
              body: 'Your certificate for the course has been issued.',
            )
            .timeout(
              const Duration(seconds: 60),
            );
      }
    } on TimeoutException {
      throw ('Check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<void> notifyStudents({required List<StudentModel> student}) async {
    try {
      for (int i = 0; i < student.length; i++) {
        if (student[i].notificationID != null) {
          await FCMAPI
              .sendToToken(
                deviceToken: student[i].notificationID!,
                title: 'Certificate Issued',
                body: 'Your certificate for the course has been issued.',
              )
              .timeout(
                const Duration(seconds: 60),
              );
        }
      }
    } on TimeoutException {
      throw ('Check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on Exception catch (e) {
      throw (e.toString());
    } catch (e) {
      throw ('Error: $e');
    }
  }
}
