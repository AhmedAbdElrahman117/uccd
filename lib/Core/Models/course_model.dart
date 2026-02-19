import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String title;
  final String description;
  final String? imageLink;
  final String? imageName;
  final String? courseID;
  final List<dynamic>? courseGoals;
  final List<dynamic>? coursePrerequests;
  final String instructor;
  final String instructorID;
  final String category;
  final String categoryID;
  final int roomNumber;
  final int duration;
  final Timestamp courseStartDate;
  final Timestamp courseEndDate;
  final Timestamp interviewStartDate;
  final Timestamp interviewEndDate;
  final int maxAcceptedStudents;
  final int? currentStudents;
  double? overallRating;
  int? ratingCount;
  int? ratingSum;
  final Timestamp? createdAt;

  CourseModel({
    required this.title,
    required this.description,
    required this.instructor,
    required this.category,
    required this.roomNumber,
    required this.duration,
    required this.courseStartDate,
    required this.courseEndDate,
    required this.interviewStartDate,
    required this.interviewEndDate,
    required this.maxAcceptedStudents,
    this.imageLink,
    this.createdAt,
    required this.instructorID,
    this.courseGoals,
    this.coursePrerequests,
    this.courseID,
    this.currentStudents,
    required this.categoryID,
    this.imageName,
    this.overallRating,
    this.ratingCount,
    this.ratingSum,
  });

  factory CourseModel.formJson(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'],
      description: map['description'],
      instructor: map['instructor'],
      category: map['category'],
      roomNumber: map['roomNumber'],
      duration: map['duration'],
      courseStartDate: map['courseStartDate'],
      courseEndDate: map['courseEndDate'],
      interviewStartDate: map['interviewStartDate'],
      interviewEndDate: map['interviewEndDate'],
      maxAcceptedStudents: map['maxAcceptedStudents'],
      imageLink: map['imageLink'],
      createdAt: map['createdAt'],
      instructorID: map['instructorId'],
      courseGoals: map['courseGoals'],
      courseID: map['courseID'],
      currentStudents: map['currentStudents'],
      categoryID: map['categoryID'],
      imageName: map['imageName'],
      ratingCount: map['ratingCount'],
      ratingSum: map['ratingSum'],
      coursePrerequests: map['coursePrerequests'],
    );
  }

  Map<String, dynamic> toStudentMap() {
    return {
      'title': title,
      'description': description,
      'instructor': instructor,
      'category': category,
      'roomNumber': roomNumber,
      'duration': duration,
      'courseStartDate': courseStartDate,
      'courseEndDate': courseEndDate,
      'interviewStartDate': interviewStartDate,
      'interviewEndDate': interviewEndDate,
      'maxAcceptedStudents': maxAcceptedStudents,
      'imageLink': null,
      'imageName': null,
      'createdAt': Timestamp.now(),
      'instructorId': instructorID,
      'courseGoals': [],
      'coursePrerequests': [],
      'courseID': courseID,
      'currentStudents': 0,
      'categoryID': categoryID,
      'isPending': true,
      'ratingCount': 0,
      'ratingSum': 0,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'instructor': instructor,
      'category': category,
      'roomNumber': roomNumber,
      'duration': duration,
      'courseStartDate': courseStartDate,
      'courseEndDate': courseEndDate,
      'interviewStartDate': interviewStartDate,
      'interviewEndDate': interviewEndDate,
      'maxAcceptedStudents': maxAcceptedStudents,
      'imageLink': imageLink,
      'imageName': imageName,
      'createdAt': Timestamp.now(),
      'instructorId': instructorID,
      'courseGoals': courseGoals,
      'coursePrerequests': coursePrerequests,
      'courseID': null,
      'currentStudents': 0,
      'categoryID': categoryID,
    };
  }

  bool compare(CourseModel other) {
    if (title == other.title &&
        description == other.description &&
        instructor == other.instructor &&
        instructorID == other.instructorID &&
        category == other.category &&
        categoryID == other.categoryID &&
        roomNumber == other.roomNumber &&
        duration == other.duration &&
        courseStartDate == other.courseStartDate &&
        courseEndDate == other.courseEndDate &&
        interviewStartDate == other.interviewStartDate &&
        interviewEndDate == other.interviewEndDate &&
        maxAcceptedStudents == other.maxAcceptedStudents &&
        imageLink == other.imageLink &&
        imageName == other.imageName) {
      return true;
    } else {
      return false;
    }
  }
}
