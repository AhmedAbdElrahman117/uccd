import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  final String? rateId;
  final String courseId;
  final String userId;
  final String userName;
  final double overallRating;
  final double contentRating;
  final double instructorRating;
  double? averageRating;
  double? averageContentRating;
  double? averageInstructorRating;
  final String? comment;
  final Timestamp? createdAt;

  RatingModel({
    this.rateId,
    required this.courseId,
    required this.userId,
    required this.userName,
    required this.overallRating,
    required this.contentRating,
    required this.instructorRating,
    this.comment,
    this.createdAt,
    this.averageRating,
    this.averageContentRating,
    this.averageInstructorRating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rateId: json['rateId'],
      courseId: json['courseId'],
      userId: json['userId'],
      userName: json['userName'],
      overallRating: json['overallRating'],
      contentRating: json['contentRating'],
      instructorRating: json['instructorRating'],
      comment: json['comment'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rateId': rateId,
      'courseId': courseId,
      'userId': userId,
      'userName': userName,
      'overallRating': overallRating,
      'contentRating': contentRating,
      'instructorRating': instructorRating,
      'comment': comment,
      'createdAt': createdAt ?? Timestamp.now(),
    };
  }
}
