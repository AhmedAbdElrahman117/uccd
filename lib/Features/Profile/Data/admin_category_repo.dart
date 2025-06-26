import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/main.dart';

class AdminCategoryRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CategoryModel>> getCategories() {
    return _firestore.collection('category').snapshots().handleError(
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
          (categories) {
            return CategoryModel.fromJson(
              categories.data(),
            );
          },
        ).toList();
      },
    ).distinct();
  }

  Future<String> addCategory({required CategoryModel category}) async {
    try {
      var doc = await _firestore
          .collection('category')
          .add(
            category.toMap(),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      await doc.update(
        {
          'id': doc.id,
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Added New Category ${category.name}',
        actionType: 'Add',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );

      return 'categoryAddedSuccessfully';
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

  Future<String> deleteCategory({required CategoryModel category}) async {
    try {
      await _firestore.collection('category').doc(category.id).delete().timeout(
            const Duration(seconds: 30),
          );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Deleted Category ${category.name}',
        actionType: 'Delete',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );

      return 'categoryDeletedSuccessfully';
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

  Future<String> updateCategory({required CategoryModel category}) async {
    try {
      await _firestore.collection('category').doc(category.id).update(
        {'name': category.name},
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Updated Category ${category.name}',
        actionType: 'Update',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );

      return 'categoryUpdatedSuccessfully';
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
