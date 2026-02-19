import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/category_model.dart';

class RegisterationFormRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    return await _firestore
        .collection('category')
        .withConverter(
          fromFirestore: (snapshot, options) => CategoryModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (value, options) => value.toMap(),
        )
        .get()
        .timeout(
          const Duration(seconds: 30),
        )
        .catchError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else if (error is TimeoutException) {
          throw ('connectionTimeout');
        } else {
          throw (error.toString());
        }
      },
    ).then(
      (value) => value.docs
          .map(
            (category) => category.data(),
          )
          .toList(),
    );
  }

  Future<void> registerData({
    required String id,
    required String phone,
    required Timestamp graduationYear,
    required String disability,
    required List<String> selectedCategories,
    required bool agree,
  }) async {
    try {
      await _firestore.collection('users').doc(id).set(
        {
          'phoneNumber': phone,
          'graduationYear': graduationYear,
          'disability': disability,
          'favouiteCategories': selectedCategories,
          'agreeOnTerms': agree,
          'isFirstRegister': false,
        },
        SetOptions(merge: true),
      ).timeout(
        const Duration(seconds: 30),
      );
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
}
