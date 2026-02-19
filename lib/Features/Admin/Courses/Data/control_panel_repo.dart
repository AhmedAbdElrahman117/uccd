import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/storage.dart';
import 'package:uccd/main.dart';

class ControlPanelRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> deleteCourse({required CourseModel course}) async {
    try {
      if (course.imageLink != null && course.imageName != null) {
        Storage.remove(
          from: 'courses',
          paths: [
            '${course.courseID}/${course.imageName}',
          ],
        );
      }

      await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .get()
          .then(
            (students) async => students.docs.map(
              (student) async {
                await _firestore
                    .collection('courses')
                    .doc(course.courseID)
                    .collection('students')
                    .doc(student.id)
                    .delete();

                await _firestore
                    .collection('users')
                    .doc(student.id)
                    .collection('courses')
                    .doc(course.courseID)
                    .delete();
              },
            ),
          );

      await _firestore.collection('courses').doc(course.courseID).delete();

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Deleted Course ${course.title}',
        actionType: 'Delete',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );
      return 'courseDeletedSuccessfully';
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> editCourseInfo({
    required CourseModel newCourse,
    XFile? image,
  }) async {
    try {
      String? link;
      if (image != null) {
        if (newCourse.imageLink != null && newCourse.imageName != null) {
          Storage.remove(
            from: 'courses',
            paths: [
              '${newCourse.courseID}/${newCourse.imageName}',
            ],
          );
        }
        link = await Storage.uploadImage(
          folderName: newCourse.courseID!,
          from: 'courses',
          image: image,
        );
      }

      await _firestore.collection('courses').doc(newCourse.courseID).update(
        {
          'title': newCourse.title,
          'description': newCourse.description,
          'roomNumber': newCourse.roomNumber,
          'duration': newCourse.duration,
          'courseStartDate': newCourse.courseStartDate,
          'courseEndDate': newCourse.courseEndDate,
          'interviewStartDate': newCourse.interviewStartDate,
          'interviewEndDate': newCourse.interviewEndDate,
          'maxAcceptedStudents': newCourse.maxAcceptedStudents,
          'courseGoals': newCourse.courseGoals,
          'imageLink': link,
          'imageName': image?.name,
        },
      ).timeout(
        const Duration(seconds: 40),
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Updated Course ${newCourse.title}',
        actionType: 'Update',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );
      return 'courseUpdatedSuccessfully';
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> editCourseCategory({
    required CourseModel course,
    required String oldCategoryID,
    required String newCategoryName,
    required String newCategoryID,
  }) async {
    try {
      var enrolledStudents = await _firestore
          .collection('courses')
          .doc(course.courseID)
          .collection('students')
          .get();

      for (int i = 0; i < enrolledStudents.docs.length; i++) {
        var user = await _firestore
            .collection('users')
            .doc(enrolledStudents.docs[i].id)
            .get();

        if (UserModel.fromJson(user.data()!)
            .enrolledCategories!
            .contains(newCategoryName)) {
          await _firestore
              .collection('courses')
              .doc(course.courseID)
              .collection('students')
              .doc(user.id)
              .delete();

          await _firestore
              .collection('users')
              .doc(user.id)
              .collection('courses')
              .doc(course.courseID)
              .delete();
        } else {
          await _firestore.collection('users').doc(user.id).update(
            {
              'enrolledCategories': FieldValue.arrayRemove([oldCategoryID]),
            },
          );
          await _firestore.collection('users').doc(user.id).update(
            {
              'enrolledCategories': FieldValue.arrayUnion([newCategoryID]),
            },
          );
        }
      }

      await _firestore.collection('courses').doc(course.courseID).update(
        {
          'category': newCategoryName,
          'categoryID': newCategoryID,
        },
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action:
            'Updated Course ${course.title} Category From ${course.category} To $newCategoryName',
        actionType: 'Update',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );
      return 'categoryChangedSuccessfully';
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
