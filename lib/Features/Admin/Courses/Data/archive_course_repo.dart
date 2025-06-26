import 'dart:async';
import 'dart:developer';
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
        .orderBy(
          'courseEndDate',
          descending: true,
        )
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
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          log(error.toString());
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) => snapshot.docs.map(
        (e) {
          double rate = 0;
          e.data().ratingCount != null && e.data().ratingSum != null
              ? rate = e.data().overallRating =
                  (e.data().ratingSum! / e.data().ratingCount!)
              : rate = e.data().overallRating = 0;

          return e.data()..overallRating = rate;
        },
      ).toList(),
    );
  }

  Future<double> getAverageRating(String courseId) async {
    try {
      var doc = await _firestore
          .collection('courses')
          .doc(courseId)
          .collection('ratings')
          .get();

      if (doc.docs.isEmpty) return 0.0;

      final totalRating = doc.docs.fold<double>(
        0.0,
        (plus, doc) =>
            plus + (doc.data()['overallRating'] as double).toDouble(),
      );
      return totalRating / doc.docs.length;
    } on TimeoutException {
      throw ('checkInternetConnectionAndTryAgain');
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      log(e.toString());
      throw (e.toString());
    }
  }
}
