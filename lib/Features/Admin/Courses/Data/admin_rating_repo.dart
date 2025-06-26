import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/rating_model.dart';

class AdminRatingRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<RatingModel>> getRatings({required String courseId}) {
    return _firestore
        .collection('courses')
        .doc(courseId)
        .collection('ratings')
        .withConverter(
          fromFirestore: (snapshot, options) => RatingModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (rating, options) => rating.toJson(),
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
          (docs) {
            return docs.data();
          },
        ).toList();
      },
    );
  }
}
