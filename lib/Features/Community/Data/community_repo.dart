import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/comment_model.dart';
import 'package:uccd/Core/Models/post_model.dart';

abstract class CommunityRepo {
  Stream<List<PostModel>> getPosts();

  Stream<List<CommentModel>> getComments({required String postID});

  Future<String> addPost({required PostModel post, XFile? image});

  Future<String> deletePost({required PostModel post});

  Future<String> updatePost({
    required PostModel post,
    required String newDescription,
    required XFile? image,
  });

  Future<String> addComment({
    required CommentModel comment,
    required String postID,
  });

  Future<String> triggerLike({required String postID});
}
