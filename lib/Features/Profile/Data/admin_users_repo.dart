import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/firebase_api.dart';

class AdminUsersRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<UserModel>> getAdmins() {
    return _firestore
        .collection('users')
        .where('role', isEqualTo: 'Admin')
        .orderBy('createdAt', descending: true)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toInstructorMap(value.id!),
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
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (student) => student.data(),
              )
              .toList(),
        )
        .distinct();
  }

  Stream<List<UserModel>> getInstructors() {
    return _firestore
        .collection('users')
        .where('role', isEqualTo: 'Instructor')
        .orderBy('createdAt', descending: true)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toInstructorMap(value.id!),
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
        )
        .map(
          (snapshot) => snapshot.docs
              .map(
                (student) => student.data(),
              )
              .toList(),
        )
        .distinct();
  }

  Stream<List<UserModel>> getStudents() {
    try {
      return _firestore
          .collection('users')
          .where('role', isEqualTo: 'Student')
          .where('isFirstRegister', isEqualTo: false)
          .orderBy('createdAt', descending: true)
          .withConverter(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toInstructorMap(value.id!),
          )
          .snapshots()
          .handleError(
            (error) {
              if (error is SocketException) {
                throw ('noInternetConnection');
              } else if (error is TimeoutException) {
                throw ('connectionTimeoutTryAgain');
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
                  (student) => student.data(),
                )
                .toList(),
          )
          .distinct();
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeoutTryAgain');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> addUser({
    required UserModel user,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(
            user.role == 'Student'
                ? user.toStudentMap(credential.user!.uid)
                : user.toInstructorMap(credential.user!.uid),
          )
          .timeout(
            const Duration(seconds: 30),
          );
      return 'userCreatedSuccessfully';
    } on FirebaseAuthException catch (e) {
      throw (AppException.firebaseAuthSignup(e.code));
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> deleteUser({required UserModel user}) async {
    try {
      String idToken = await FirebaseAPI.getIdToken(
        email: user.email,
        password: user.password,
      );

      FirebaseAPI.deleteAuth(
        email: user.email,
        password: user.password,
        idToken: idToken,
      );

      if (user.role == 'Student') {
        var userCourses = await _getStudentsCourses(user.id!);

        if (userCourses != null) {
          for (int index = 0; index < userCourses.docs.length; index++) {
            await _firestore
                .collection('users')
                .doc(user.id)
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
                .doc(user.id)
                .delete()
                .timeout(
                  const Duration(seconds: 30),
                );
          }
        }
      }

      await _firestore.collection('users').doc(user.id).delete();
      return 'userDeletedSuccessfully';
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> updateUser({
    required UserModel newUser,
    required UserModel currentUser,
  }) async {
    try {
      if (newUser.email != currentUser.email ||
          newUser.password != currentUser.password) {
        String idToken = await FirebaseAPI.getIdToken(
          email: currentUser.email,
          password: currentUser.password,
        );

        FirebaseAPI.updatePassword(
          newPassword: newUser.password,
          idToken: idToken,
        );
      }

      await _firestore
          .collection('users')
          .doc(currentUser.id)
          .update(
            currentUser.role == 'Student'
                ? {
                    'name': newUser.name,
                    'email': newUser.email,
                    'password': newUser.password,
                    'department': newUser.department,
                    'nationalID': newUser.nationalID,
                    'universityID': newUser.universityID,
                    'year': newUser.year,
                  }
                : {
                    'name': newUser.name,
                    'password': newUser.password,
                  },
          )
          .timeout(
            const Duration(seconds: 30),
          );
      return 'userUpdatedSuccessfully';
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> _getStudentsCourses(
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

  addAdmin({required String email, required String password}) {}
}
