import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String userName;
  final String? userImage;
  final String comment;
  final String? commentID;
  final Timestamp? commentAt;

  CommentModel({
    required this.userName,
    this.userImage,
    required this.comment,
    this.commentID,
    this.commentAt,
  });

  Map<String, dynamic> toMap(CommentModel comment) {
    return {
      'userName': comment.userName,
      'userImage': comment.userImage,
      'comment': comment.comment,
      'commentID': null,
      'commentAt': Timestamp.now(),
    };
  }

  factory CommentModel.formJson(Map<String, dynamic> map) {
    return CommentModel(
      userName: map['userName'],
      comment: map['comment'],
      userImage: map['userImage'],
      commentID: map['commentID'],
      commentAt: map['commentAt'],
    );
  }
}
