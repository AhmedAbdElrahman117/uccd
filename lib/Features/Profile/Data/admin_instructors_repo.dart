import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/firebase_api.dart';

class AdminInstructorsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getInstructors() {
    return _firestore
        .collection('users')
        .where('role', isEqualTo: 'Instructor')
        .orderBy('createdAt', descending: true)
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

  Future<String> addInstructor({required UserModel instructor}) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: instructor.email,
        password: instructor.password,
      );

      await _firestore
          .collection('users')
          .doc(user.user!.uid)
          .set(
            instructor.toInstructorMap(user.user!.uid),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return 'instructorCreatedSuccessfully';
    } on FirebaseAuthException catch (e) {
      throw (AppException.firebaseAuthSignup(e.code));
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  deleteInstructor({
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

      await _firestore.collection('users').doc(id).delete();

      return 'instructorDeletedSuccessfully';
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  updateInstructor({
    required UserModel newInstructor,
    required UserModel currentInstructor,
  }) async {
    try {
      String idToken = await FirebaseAPI.getIdToken(
        email: currentInstructor.email,
        password: currentInstructor.password,
      );

      FirebaseAPI.updatePassword(
        newPassword: newInstructor.password,
        idToken: idToken,
      );

      await _firestore.collection('users').doc(currentInstructor.id).update(
        {
          'name': newInstructor.name,
          'password': newInstructor.password,
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      return 'instructorUpdatedSuccessfully';
    } on SocketException {
      throw ('noInternetConnection');
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
