import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Community/Data/commnuity_repo.dart';
import 'package:uccd/generated/l10n.dart';

class EditPostDialog extends StatefulWidget {
  final PostModel post;

  const EditPostDialog({
    super.key,
    required this.post,
  });

  @override
  State<EditPostDialog> createState() => _EditPostDialogState();
}

class _EditPostDialogState extends State<EditPostDialog> {
  late TextEditingController _postController;
  XFile? _selectedImage;
  bool _isLoading = false;
  String? _errorMessage;
  final CommnuityRepo _repo = CommnuityRepo();
  bool _imageChanged = false;

  @override
  void initState() {
    super.initState();
    _postController = TextEditingController(text: widget.post.postDescription);
  }

  @override
  void dispose() {
    _postController.dispose();
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
          _imageChanged = true;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = S.of(context).failedToPickImage(e.toString());
      });
    }
  }

  Future<void> _updatePost() async {
    if (_postController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = S.of(context).postContentEmpty;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _repo.updatePost(
        post: widget.post,
        newDescription: _postController.text.trim(),
        image: _imageChanged ? _selectedImage : null,
      );

      if (context.mounted) {
        AppBanners.showSuccess(message: result);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Dialog(
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
                    S.of(context).editPostDialogTitle,
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

              // Post content field
              TextField(
                controller: _postController,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: S.of(context).editPostContentHint,
                  hintStyle: TextStyle(
                    color: textColor.withValues(alpha: 0.6),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                minLines: 3,
                maxLines: 8,
              ),

              // Image preview
              if (_imageChanged && _selectedImage != null)
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
                              _imageChanged = true;
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
                )
              else if (!_imageChanged && widget.post.postImageLink != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.post.postImageLink!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey.shade300,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey.shade300,
                              alignment: Alignment.center,
                              child: const Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImage = null;
                              _imageChanged =
                                  true; // Mark as changed to remove existing image
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

                  // Cancel button
                  TextButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    child: Text(
                      S.of(context).cancelButtonLabel,
                      style: TextStyle(
                        color: _isLoading ? Colors.grey : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Update button
                  ElevatedButton(
                    onPressed: _isLoading ? null : _updatePost,
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
                        : Text(S.of(context).updateButtonLabel),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
