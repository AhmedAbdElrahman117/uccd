import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/firebase_api.dart';

class AdminStudetnsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getStudents() {
    return _firestore
        .collection('users')
        .where('role', isEqualTo: 'Student')
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
        return snapshot.docs.map(
          (doc) {
            return UserModel.fromJson(doc.data());
          },
        ).toList();
      },
    ).distinct();
  }

  Future<String> addStudent({required UserModel student}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: student.email,
        password: student.password,
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(
            student.toStudentMap(credential.user!.uid),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return 'studentAddedSuccessfully';
    } on FirebaseAuthException catch (e) {
      throw (AppException.firebaseAuthSignup(e.code));
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> deleteStudent({
    required String email,
    required String password,
    required String id,
  }) async {
    try {
      String idToken = await FirebaseAPI.getIdToken(
        email: email,
        password: password,
      );

      FirebaseAPI.deleteAuth(
        email: email,
        password: password,
        idToken: idToken,
      );

      var userCourses = await _getUserCourses(id);

      if (userCourses != null) {
        for (int index = 0; index < userCourses.docs.length; index++) {
          await _firestore
              .collection('users')
              .doc(id)
              .collection('courses')
              .doc(userCourses.docs[index].id)
              .delete()
              .timeout(
                const Duration(seconds: 30),
              );

          await _firestore
              .collection('courses')
              .doc(userCourses.docs[index].id)
              .collection('students')
              .doc(id)
              .delete()
              .timeout(
                const Duration(seconds: 30),
              );
        }
      }
      await _firestore.collection('users').doc(id).delete();
      return 'userDeletedSuccessfully';
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> updateStudent({
    required UserModel currentStudent,
    required UserModel newStudent,
  }) async {
    try {
      if (newStudent.password != currentStudent.password) {
        String idToken = await FirebaseAPI.getIdToken(
          email: currentStudent.email,
          password: currentStudent.password,
        );

        FirebaseAPI.updatePassword(
          newPassword: newStudent.password,
          idToken: idToken,
        );
      }

      await _firestore.collection('users').doc(currentStudent.id).update(
        {
          'name': newStudent.name,
          'email': newStudent.email,
          'password': newStudent.password,
          'department': newStudent.department,
          'nationalID': newStudent.nationalID,
          'universityID': newStudent.universityID,
          'year': newStudent.year,
        },
      );

      return 'studentUpdatedSuccessfully';
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on SocketException {
      throw ('noInternetConnection');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> _getUserCourses(
      String id) async {
    try {
      var userCourses = await _firestore
          .collection('users')
          .doc(id)
          .collection('courses')
          .get()
          .timeout(
            const Duration(seconds: 40),
          );

      if (userCourses.docs.isNotEmpty) {
        List<String> coursesID = List.generate(
          userCourses.docs.length,
          (index) {
            return userCourses.docs[index].get('id');
          },
        );

        var courses = await _firestore
            .collection('courses')
            .where(
              'courseID',
              whereIn: coursesID,
            )
            .get()
            .timeout(
              const Duration(seconds: 40),
            );

        return courses;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
