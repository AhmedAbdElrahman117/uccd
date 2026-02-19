import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String name;
  final Timestamp? createdAt;

  CategoryModel({required this.name, this.createdAt, this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': Timestamp.now(),
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      createdAt: map['createdAt'],
      id: map['id'],
    );
  }
}
