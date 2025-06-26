import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/rating_model.dart';

class RateCourseRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitRating({
    required RatingModel rating,
  }) async {
    try {
      var doc = await _firestore
          .collection('courses')
          .doc(rating.courseId)
          .collection('ratings')
          .add(
            rating.toJson(),
          );

      await doc.update(
        {
          'rateId': doc.id,
        },
      );

      await _firestore.collection('courses').doc(rating.courseId).update(
        {
          'ratingSum': FieldValue.increment(
            rating.overallRating,
          ),
          'ratingsCount': FieldValue.increment(1),
        },
      );
    } on TimeoutException {
      throw ('checkInternetConnectionAndTryAgain');
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
