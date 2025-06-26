import 'package:cloud_firestore/cloud_firestore.dart';

class LogModel {
  final String userName;
  final String userEmail;
  final String action;
  final String actionType;
  final Timestamp createdAt;

  LogModel({
    required this.userName,
    required this.userEmail,
    required this.action,
    required this.actionType,
    required this.createdAt,
  });

  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      userName: json['userName'],
      userEmail: json['userEmail'],
      action: json['action'],
      actionType: json['actionType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'action': action,
      'actionType': actionType,
      'createdAt': createdAt,
    };
  }
}
