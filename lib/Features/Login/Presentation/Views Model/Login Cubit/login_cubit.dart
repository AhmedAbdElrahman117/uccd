import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_states.dart';
import 'package:uccd/main.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            const Duration(seconds: 60),
          );

      UserModel user = await save(
        id: userCredential.user!.uid,
      );

      checkRole(
        user,
      );
    } on FirebaseAuthException catch (e) {
      log(e.message ?? e.code);
      emit(
        LoginFailed(
          errorMessage: AppException.firebaseAuthLogin(e.code),
        ),
      );
    } on TimeoutException {
      emit(
        LoginFailed(
          errorMessage: 'connectionTimeout',
        ),
      );
    } on Exception catch (e) {
      emit(
        LoginFailed(errorMessage: e.toString()),
      );
    }
  }

  Future<UserModel> save({required String id}) async {
    try {
      var currentNotiToken = await FirebaseMessaging.instance.getToken();
      UserModel data = await getUserData(id: id);
      InternalStorage.setString('id', data.id!);
      InternalStorage.setString('role', data.role);
      InternalStorage.setString('email', data.email);
      InternalStorage.setString('name', data.name);
      if (data.role == 'Student') {
        InternalStorage.setString('department', data.department!);
        InternalStorage.setString('year', data.year!);
      }
      if (data.notificationId == null ||
          data.notificationId!.isEmpty ||
          currentNotiToken != data.notificationId) {
        await updateNotificationID(id: id);
      }
      return data;
    } catch (e) {
      throw (e.toString());
    }
  }

  void checkRole(UserModel user) {
    switch (user.role) {
      case 'SuperAdmin':
        emit(
          SuperAdminRole(),
        );
      case 'Admin':
        emit(
          AdminRole(),
        );
      case 'Instructor':
        emit(
          InstructorRole(),
        );
      case 'Student':
        emit(
          StudentRole(user),
        );
      default:
        emit(
          LoginFailed(errorMessage: 'noUser'),
        );
    }
  }

  Future<UserModel> getUserData({required String id}) async {
    try {
      final data = await _firestore.collection('users').doc(id).get();
      if (data.exists) {
        return UserModel.fromJson(data.data()!);
      } else {
        throw ('No User Found\nPlease Contact Support');
      }
    } catch (e) {
      log(e.toString());
      throw (e.toString());
    }
  }

  Future<void> updateNotificationID({required String id}) async {
    try {
      String? token = await _messaging.getToken();
      if (token != null) {
        await _firestore.collection('users').doc(id).update(
          {'notificationID': token},
        );
      } else {
        throw ('Unable to generate Notification Token');
      }
    } catch (e) {
      rethrow;
    }
  }
}
