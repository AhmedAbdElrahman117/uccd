import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/category_model.dart';

class AdminCategoryRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CategoryModel>> getCategories() {
    return _firestore.collection('category').snapshots().handleError(
      (error) {
        if (error is SocketException) {
          throw ('No Internet Connection');
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

      return 'Category Added Successfully';
    } on TimeoutException {
      throw ('Check your Internet Connection and try again');
    } on SocketException {
      throw ('No Internet Connection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> deleteCategory({required String id}) async {
    try {
      await _firestore.collection('category').doc(id).delete().timeout(
            const Duration(seconds: 30),
          );

      return 'Category Deleted Successfully';
    } on TimeoutException {
      throw ('Check your Internet Connection and try again');
    } on SocketException {
      throw ('No Internet Connection');
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

      return 'Category Updated Successfully';
    } on TimeoutException {
      throw ('Check your Internet Connection and try again');
    } on SocketException {
      throw ('No Internet Connection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
