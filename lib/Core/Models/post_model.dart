import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String publisherName;
  final String? publisherImage;
  final Timestamp? publishedAt;
  final String postDescription;
  final String? postImageLink;
  final String? postImageName;
  final String? postID;
  final String publisherEmail;
  final int? likesCount;
  final int? commentsCount;
  bool? isLiked;

  PostModel({
    required this.postDescription,
    this.postImageLink,
    required this.publisherName,
    this.publisherImage,
    this.publishedAt,
    this.postID,
    this.postImageName,
    required this.publisherEmail,
    this.commentsCount,
    this.likesCount,
    this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return {
      'postDescription': postDescription,
      'postImageLink': postImageLink,
      'postImageName': postImageName,
      'publisherName': publisherName,
      'publisherImage': publisherImage,
      'publisherEmail': publisherEmail,
      'publishedAt': Timestamp.now(),
      'postID': null,
      'commentsCount': 0,
      'likesCount': 0,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map, [bool? isLiked]) {
    return PostModel(
      postDescription: map['postDescription'],
      publisherName: map['publisherName'],
      publishedAt: map['publishedAt'],
      postImageLink: map['postImageLink'],
      postImageName: map['postImageName'],
      publisherImage: map['publisherImage'],
      postID: map['postID'],
      publisherEmail: map['publisherEmail'],
      commentsCount: map['commentsCount'],
      likesCount: map['likesCount'],
      isLiked: isLiked,
    );
  }
}
