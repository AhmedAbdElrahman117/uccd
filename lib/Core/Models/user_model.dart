import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String? universityID;
  final String? nationalID;
  final String? department;
  final String? year;
  final bool? isEnrolled;
  final List<dynamic>? enrolledCategories;
  final String? notificationId;
  final String? phoneNumber;
  final Timestamp? graduationYear;
  final String? disability;
  final List<dynamic>? favouiteCategories;
  final bool? agreeOnTerms;
  final bool? isFirstRegister;
  final Timestamp? createdAt;

  UserModel({
    this.id,
    this.isEnrolled,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.department,
    this.nationalID,
    this.universityID,
    this.year,
    this.notificationId,
    this.createdAt,
    this.enrolledCategories,
    this.phoneNumber,
    this.graduationYear,
    this.disability,
    this.favouiteCategories,
    this.agreeOnTerms,
    this.isFirstRegister = true,
  });

  Map<String, dynamic> toInstructorMap(String id) {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'notificationID': notificationId,
      'createdAt': Timestamp.now(),
    };
  }

  Map<String, dynamic> toStudentMap(String id) {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'department': department,
      'nationalID': nationalID,
      'universityID': universityID,
      'year': year,
      'notificationID': notificationId,
      'isEnrolled': isEnrolled,
      'enrolledCategories': enrolledCategories,
      'phoneNumber': phoneNumber,
      'graduationYear': graduationYear,
      'disability': disability,
      'favouiteCategories': favouiteCategories,
      'agreeOnTerms': agreeOnTerms,
      'isFirstRegister': isFirstRegister,
      'createdAt': Timestamp.now(),
    };
  }

  bool compare(UserModel user) {
    if (user.name == name &&
        user.email == email &&
        user.password == password &&
        user.universityID == universityID &&
        user.nationalID == nationalID &&
        user.department == department &&
        user.year == year) {
      return true;
    } else {
      return false;
    }
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      role: map['role'],
      notificationId: map['notificationID'],
      createdAt: map['createdAt'],
      universityID: map['universityID'],
      nationalID: map['nationalID'],
      department: map['department'],
      year: map['year'],
      enrolledCategories: map['enrolledCategories'],
      isEnrolled: map['isEnrolled'],
      agreeOnTerms: map['agreeOnTerms'],
      disability: map['disability'],
      favouiteCategories: map['favouiteCategories'],
      graduationYear: map['graduationYear'],
      isFirstRegister: map['isFirstRegister'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
