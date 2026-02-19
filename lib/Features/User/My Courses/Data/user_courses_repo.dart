import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/main.dart';

class UserCoursesRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getCourses({
    required List<String> userCourseIds,
  }) {
    return _firestore
        .collection('courses')
        .where(
          'courseID',
          whereIn: userCourseIds,
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
          throw (error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs
            .map(
              (e) => e.data(),
            )
            .toList();
      },
    );
  }

  Stream<Map<String, dynamic>> getUserCourse({
    int? limit,
    bool? acceptedOnly,
  }) {
    return _firestore
        .collection('users')
        .doc(InternalStorage.getString('id'))
        .collection('courses')
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          log(error.code);
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (value) {
        Map<String, dynamic> studentCourses = {};
        var acceptedOnlyValues = value.docs.where(
          (element) => element.get('isAccepted') == true,
        );
        List.generate(
          limit != null && limit <= value.docs.length
              ? limit
              : acceptedOnly != null
                  ? acceptedOnlyValues.length
                  : value.docs.length,
          (index) {
            studentCourses[value.docs[index].get('id')] =
                value.docs[index].get('isAccepted');
          },
        );
        return studentCourses;
      },
    );
  }

  Future<bool> isStudentRated(String courseId) async {
    try {
      var doc = await _firestore
          .collection('users')
          .doc(InternalStorage.getString('id'))
          .collection('courses')
          .doc(courseId)
          .collection('ratings')
          .where(
            'userId',
            isEqualTo: InternalStorage.getString('id'),
          )
          .get();

      return doc.docs.isEmpty;
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
