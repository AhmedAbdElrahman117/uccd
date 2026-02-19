import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Add%20Post%20Cubit/add_post_cubit.dart';
import 'package:uccd/main.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({
    super.key,
    required GlobalKey<FormState> postFormKey,
    required this.postDescription,
    this.pickedImage,
    this.post,
  }) : _postFormKey = postFormKey;

  final GlobalKey<FormState> _postFormKey;
  final TextEditingController postDescription;
  final XFile? pickedImage;
  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        title: post == null ? 'Publish' : 'Edit',
        onPressed: () async {
          if (_postFormKey.currentState!.validate()) {
            if (post == null) {
              PostModel post = PostModel(
                postDescription: postDescription.text,
                publisherName: InternalStorage.getString('name'),
                publisherEmail: InternalStorage.getString('email'),
              );

              BlocProvider.of<AddPostCubit>(context).addPost(
                post: post,
                image: pickedImage,
              );
            } else {
              BlocProvider.of<AddPostCubit>(context).updatePost(
                post: post!,
                image: pickedImage,
                newDescription: postDescription.text,
              );
            }
          }
        },
      ),
    );
  }
}
