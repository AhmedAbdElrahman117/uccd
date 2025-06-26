import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/notification_api.dart';
import 'package:uccd/Core/storage.dart';
import 'package:uccd/main.dart';

class CommnuityRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<PostModel>> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy(
          'publishedAt',
          descending: true,
        )
        .withConverter(
          fromFirestore: (snapshot, options) => PostModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('no Internet Connection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.map(
          (post) {
            PostModel postModel = post.data();
            isPostsLiked(post.data().postID!).listen(
              (event) {
                postModel.isLiked = event;
              },
            );
            return postModel;
          },
        ).toList();
      },
    ).distinct();
  }

  Stream<bool> isPostsLiked(String postID) {
    return _firestore
        .collection('posts')
        .doc(postID)
        .collection('likes')
        .doc(InternalStorage.getString('id'))
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('no Internet Connection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.exists;
      },
    ).distinct();
  }

  Stream<List<CommentModel>> getComments({required String postID}) {
    return _firestore
        .collection('posts')
        .doc(postID)
        .collection('comments')
        .orderBy(
          'commentAt',
          descending: false,
        )
        .withConverter(
          fromFirestore: (snapshot, options) =>
              CommentModel.formJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(value),
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('no Internet Connection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.map(
          (comments) {
            return comments.data();
          },
        ).toList();
      },
    ).distinct();
  }

  Future<String> addPost({required PostModel post, XFile? image}) async {
    try {
      DocumentReference<Map<String, dynamic>> doc = await _firestore
          .collection('posts')
          .add(
            post.toMap(),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      await doc.update(
        {
          'postID': doc.id,
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      String? link = await Storage.uploadImage(
        image: image,
        folderName: doc.id,
        from: 'uccd posts',
      );

      await doc.update(
        {
          'postImageLink': link,
          'postImageName': image?.name,
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Added New Post To Community',
        actionType: 'Add',
        createdAt: Timestamp.now(),
      );

      await _firestore.collection('logs').add(
            log.toMap(),
          );

      await FCMAPI.sendToTopic(
        body: 'New Post Added to Community\nCheck it out!',
        title: 'New Post',
      );
      return 'post Added Successfully';
    } on TimeoutException {
      throw ('check Internet Connection And Try Again');
    } on SocketException {
      throw ('no Internet Connection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> deletePost({required PostModel post}) async {
    try {
      if (post.postImageLink != null && post.postImageName != null) {
        Storage.remove(
          from: 'uccd posts',
          paths: ['${post.postID}/${post.postImageName}'],
        );
      }

      var postRef =
          await _firestore.collection('posts').doc(post.postID).get().timeout(
                const Duration(seconds: 30),
              );
      var likesRef = await _getPostLikes(post);
      var commentsRef = await _getPostComment(post);

      await _firestore.runTransaction(
        (transaction) async {
          for (int i = 0; i < commentsRef.docs.length; i++) {
            transaction.delete(commentsRef.docs[i].reference);
          }
          for (int i = 0; i < likesRef.docs.length; i++) {
            transaction.delete(likesRef.docs[i].reference);
          }
          transaction.delete(postRef.reference);
        },
      ).timeout(
        const Duration(minutes: 1),
      );

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Deleted Post From Community',
        actionType: 'Delete',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );
      return 'post Deleted Successfully';
    } on TimeoutException {
      throw ('check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> updatePost({
    required PostModel post,
    required String newDescription,
    required XFile? image,
  }) async {
    try {
      if (image != null) {
        await _updatePostWithImage(post, image, newDescription);
      } else {
        await _firestore.collection('posts').doc(post.postID).update(
          {
            'postDescription': newDescription,
          },
        ).timeout(
          const Duration(seconds: 30),
        );
      }

      LogModel log = LogModel(
        userName: InternalStorage.getString('name'),
        userEmail: InternalStorage.getString('email'),
        action: 'Updated Post in Community',
        actionType: 'Update',
        createdAt: Timestamp.now(),
      );

      _firestore.collection('logs').add(
            log.toMap(),
          );
      return 'postUpdatedSuccessfully';
    } on TimeoutException {
      throw ('check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> triggerLike({required String postID}) async {
    try {
      var likeDoc = await _firestore
          .collection('posts')
          .doc(postID)
          .collection('likes')
          .doc(InternalStorage.getString('id'))
          .get()
          .timeout(
            const Duration(seconds: 30),
          );

      if (likeDoc.exists) {
        await _dislike(postID);
        return 'Like Removed';
      } else {
        await _like(postID);
        return 'Like Added';
      }
    } on TimeoutException {
      throw ('check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<String> addComment(
      {required CommentModel comment, required String postID}) async {
    try {
      await _firestore
          .collection('posts')
          .doc(postID)
          .collection('comments')
          .add(
            comment.toMap(comment),
          )
          .timeout(
            const Duration(seconds: 30),
          )
          .then(
        (value) async {
          await value.update(
            {
              'commentID': value.id,
            },
          );

          await _firestore.collection('posts').doc(postID).update(
            {
              'commentsCount': FieldValue.increment(1),
            },
          );
        },
      ).timeout(
        const Duration(seconds: 40),
      );
      return 'commentAddedSuccessfully';
    } on TimeoutException {
      throw ('check Internet Connection And TryAgain');
    } on SocketException {
      throw ('no Internet Connection');
    } on StorageException catch (e) {
      throw (e.message);
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  Future<void> _like(String postID) async {
    await _firestore
        .collection('posts')
        .doc(postID)
        .collection('likes')
        .doc(InternalStorage.getString('id'))
        .set({})
        .timeout(const Duration(seconds: 30))
        .timeout(
          const Duration(seconds: 30),
        );
    await _firestore.collection('posts').doc(postID).update(
      {
        'likesCount': FieldValue.increment(1),
      },
    );
  }

  Future<void> _dislike(String postID) async {
    await _firestore
        .collection('posts')
        .doc(postID)
        .collection('likes')
        .doc(InternalStorage.getString('id'))
        .delete()
        .timeout(const Duration(seconds: 30))
        .timeout(
          const Duration(seconds: 30),
        );

    await _firestore.collection('posts').doc(postID).update(
      {
        'likesCount': FieldValue.increment(-1),
      },
    );
  }

  Future<void> _updatePostWithImage(
      PostModel post, XFile image, String newDescription) async {
    Storage.remove(
      from: 'uccd posts',
      paths: [
        '${post.postID}/${post.postImageName}',
      ],
    );

    String? newImageLink = await Storage.uploadImage(
      folderName: post.postID!,
      image: image,
      from: 'uccd posts',
    );

    await _firestore.collection('posts').doc(post.postID).update(
      {
        'postDescription': newDescription,
        'postImageLink': newImageLink,
        'postImageName': image.name,
      },
    ).timeout(
      const Duration(seconds: 30),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getPostComment(
      PostModel post) async {
    return await _firestore
        .collection('posts')
        .doc(post.postID)
        .collection('comments')
        .get()
        .timeout(
          const Duration(seconds: 30),
        );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getPostLikes(
      PostModel post) async {
    return await _firestore
        .collection('posts')
        .doc(post.postID)
        .collection('likes')
        .get()
        .timeout(
          const Duration(seconds: 30),
        );
  }
}
