import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/main.dart';

class StudentModel {
  final String? name;
  final String? studentID;
  final String gender;
  final String disability;
  final String? nationalID;
  final String? universityID;
  final String? email;
  final String phone;
  final String? department;
  final String? year;
  final Timestamp expectedGraduationYear;
  final String? notificationID;
  final Timestamp? registeredAt;
  final bool? isAccepted;
  List<dynamic>? attendanceDates;
  List<dynamic>? absenceDates;
  bool? isAttended;

  StudentModel({
    this.name,
    required this.gender,
    required this.disability,
    this.nationalID,
    this.universityID,
    this.email,
    required this.phone,
    this.department,
    this.year,
    required this.expectedGraduationYear,
    this.notificationID,
    this.registeredAt,
    this.isAccepted,
    this.studentID,
    this.attendanceDates,
    this.absenceDates,
    this.isAttended,
  });

  factory StudentModel.fromUser(UserModel user) {
    return StudentModel(
      name: user.name,
      email: user.email,
      department: user.department,
      gender: 'male',
      disability: user.disability!,
      phone: user.phoneNumber!,
      expectedGraduationYear: user.graduationYear!,
      nationalID: user.nationalID,
      notificationID: user.notificationId,
      registeredAt: Timestamp.now(),
      universityID: user.universityID,
      year: user.year,
      studentID: InternalStorage.getString('id'),
      isAccepted: null,
      absenceDates: [],
      attendanceDates: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'disability': disability,
      'nationalID': nationalID,
      'universityID': universityID,
      'email': email,
      'phone': phone,
      'department': department,
      'year': year,
      'expectedGraduationYear': expectedGraduationYear,
      'notificationID': notificationID,
      'registeredAt': Timestamp.now(),
      'isAccepted': null,
      'studentID': InternalStorage.getString('id'),
      'attendanceDates': attendanceDates,
      'absenceDates': absenceDates,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      gender: map['gender'],
      disability: map['disability'],
      nationalID: map['nationalID'],
      universityID: map['universityID'],
      email: map['email'],
      phone: map['phone'],
      department: map['department'],
      year: map['year'],
      expectedGraduationYear: map['expectedGraduationYear'],
      notificationID: map['notificationID'],
      isAccepted: map['isAccepted'],
      registeredAt: map['registeredAt'],
      studentID: map['studentID'],
      attendanceDates: map['attendanceDates'],
      absenceDates: map['absenceDates'],
    );
  }
}
