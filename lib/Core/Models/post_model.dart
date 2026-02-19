import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String publisherName;
  final String? publisherImage;
  final Timestamp? publishedAt;
  final String postDescription;
  final String? postImageLink;
  final String? postImageName;
  final List<dynamic>? likes;
  final String? postID;
  final String publisherEmail;
  final int? likesCount;
  bool? isLiked;
  final int? commentsCount;

  PostModel({
    required this.postDescription,
    this.postImageLink,
    required this.publisherName,
    this.publisherImage,
    this.publishedAt,
    this.likes,
    this.postID,
    this.postImageName,
    this.isLiked,
    required this.publisherEmail,
    this.commentsCount,
    this.likesCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'postDescription': postDescription,
      'postImageLink': null,
      'postImageName': null,
      'publisherName': publisherName,
      'publisherImage': null,
      'publisherEmail': publisherEmail,
      'publishedAt': Timestamp.now(),
      'likes': [],
      'postID': null,
      'commentsCount': 0,
      'likesCount': 0,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      postDescription: map['postDescription'],
      publisherName: map['publisherName'],
      publishedAt: map['publishedAt'],
      postImageLink: map['postImageLink'],
      postImageName: map['postImageName'],
      publisherImage: map['publisherImage'],
      likes: map['likes'] as List<dynamic>,
      postID: map['postID'],
      publisherEmail: map['publisherEmail'],
      commentsCount: map['commentsCount'],
      likesCount: map['likesCount'],
    );
  }
}
