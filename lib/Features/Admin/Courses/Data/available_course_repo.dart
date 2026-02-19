import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/storage.dart';

class AvailableCourseRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getAdminCourses() {
    return _firestore
        .collection('courses')
        .orderBy(
          'courseEndDate',
          descending: true,
        )
        .where(
          'courseEndDate',
          isGreaterThanOrEqualTo: Timestamp.now(),
        )
        .orderBy(
          'createdAt',
          descending: true,
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
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => CourseModel.formJson(
                  doc.data(),
                ),
              )
              .toList(),
        )
        .distinct();
  }

  Future<String> addCourse({
    required CourseModel course,
    XFile? pickedImage,
  }) async {
    try {
      var doc = await _firestore
          .collection('courses')
          .add(
            course.toMap(),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      await doc.update(
        {
          'courseID': doc.id,
        },
      );

      String? link = await Storage.uploadImage(
        folderName: doc.id,
        image: pickedImage,
        from: 'courses',
      );

      await doc.update(
        {
          'imageLink': link,
          'imageName': pickedImage?.name,
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      return 'Course Added Successfully';
    } on TimeoutException {
      throw ('Connection Timeout');
    } on SocketException {
      throw ('No Internet Connection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
