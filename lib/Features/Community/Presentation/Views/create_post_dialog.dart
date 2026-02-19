import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Presentation/Views Model/Add Post Cubit/add_post_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views Model/Add Post Cubit/add_post_states.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class CreatePostDialog extends StatefulWidget {
  const CreatePostDialog({super.key});

  @override
  State<CreatePostDialog> createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  final TextEditingController _postController = TextEditingController();
  XFile? _selectedImage;
  bool _isLoading = false;
  String? _errorMessage;
  late AddPostCubit _addPostCubit;

  @override
  void initState() {
    super.initState();
    _addPostCubit = AddPostCubit();
  }

  @override
  void dispose() {
    _postController.dispose();
    _addPostCubit.close();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = S.of(context).failedToPickImage(e.toString());
      });
    }
  }

  Future<void> _createPost() async {
    if (_postController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = S.of(context).postContentEmpty;
      });
      return;
    }

    final post = PostModel(
      postDescription: _postController.text.trim(),
      publisherName: InternalStorage.getString('name'),
      publisherEmail: InternalStorage.getString('email'),
    );

    // Use the AddPostCubit to handle the post creation
    _addPostCubit.addPost(
      post: post,
      image: _selectedImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return BlocProvider.value(
      value: _addPostCubit,
      child: BlocListener<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddUpdateLoading) {
            setState(() {
              _isLoading = true;
              _errorMessage = null;
            });
          } else if (state is AddUpdateSuccess) {
            AppBanners.showSuccess(
              message: AppException.getLocalizedMessage(
                state.successMessage,
                context,
              ),
            );
            Navigator.pop(context);
          } else if (state is AddUpdateFailed) {
            setState(() {
              _errorMessage = state.errormessage;
              _isLoading = false;
            });
          }
        },
        child: Dialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dialog header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).createPostDialogTitle,
                        style: AppText.style18Bold(context).copyWith(
                          color: textColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // User info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            AppColor.primary.withValues(alpha: 0.2),
                        backgroundImage:
                            InternalStorage.getString('profileImage').isNotEmpty
                                ? NetworkImage(
                                    InternalStorage.getString('profileImage'))
                                : null,
                        child: InternalStorage.getString('profileImage').isEmpty
                            ? Text(
                                InternalStorage.getString('name').isNotEmpty
                                    ? InternalStorage.getString('name')[0]
                                        .toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        InternalStorage.getString('name'),
                        style: AppText.style14Bold(context).copyWith(
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Post content field
                  TextField(
                    controller: _postController,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: S.of(context).postContentHint,
                      hintStyle:
                          TextStyle(color: textColor.withValues(alpha: 0.6)),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    minLines: 3,
                    maxLines: 8,
                  ),

                  // Selected image preview
                  if (_selectedImage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(_selectedImage!.path),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Error message if any
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Action buttons
                  Row(
                    children: [
                      // Image picker button
                      IconButton(
                        onPressed: _isLoading ? null : _pickImage,
                        icon: Icon(
                          Icons.image,
                          color: _isLoading ? Colors.grey : AppColor.primary,
                        ),
                      ),
                      const Spacer(),

                      // Submit button
                      ElevatedButton(
                        onPressed: _isLoading ? null : _createPost,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                S.of(context).Post,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
