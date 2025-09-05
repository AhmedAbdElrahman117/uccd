import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Components/image_picker_container.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Add%20Post%20Cubit/add_post_cubit.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Add%20Post%20Cubit/add_post_states.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/add_post_button.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/post_description_field.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({
    super.key,
    this.post,
  });

  final PostModel? post;

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView>
    with TickerProviderStateMixin {
  late TextEditingController postDescription;
  final GlobalKey<FormState> postFormKey = GlobalKey();
  XFile? pickedImage;
  late ImagePicker picker;

  @override
  void initState() {
    picker = ImagePicker();

    postDescription = TextEditingController(
      text: widget.post?.postDescription,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocListener<AddPostCubit, AddPostStates>(
        listener: _listener,
        child: Stack(
          children: [
            OverlayBackground(
              child: Form(
                key: postFormKey,
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SectionTitle(title: 'Add Post'),
                    PostDescriptionField(
                      postDescription: postDescription,
                    ),
                    ImagePickerContainer(
                      onTap: () async {
                        pickedImage = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {});
                      },
                      imageName: pickedImage?.name,
                    ),
                    AddPostButton(
                      postFormKey: postFormKey,
                      postDescription: postDescription,
                      pickedImage: pickedImage,
                      post: widget.post,
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<AddPostCubit, AddPostStates, bool>(
              selector: (state) {
                if (state is AddUpdateLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AddPostStates state) {
    if (state is AddUpdateSuccess) {
      AppBanners.showSuccess(message: state.successMessage);
      context.pop();
    } else if (state is AddUpdateFailed) {
      AppBanners.showFailed(message: state.errormessage);
    }
  }
}
