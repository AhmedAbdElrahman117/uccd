import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Components/image_picker_container.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CourseImagePage extends StatefulWidget {
  const CourseImagePage({
    super.key,
    required this.imagePath,
  });

  final TextEditingController imagePath;

  @override
  State<CourseImagePage> createState() => _CourseImagePageState();
}

class _CourseImagePageState extends State<CourseImagePage>
    with AutomaticKeepAliveClientMixin {
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Text(
                S.of(context).courseImage,
                style: AppText.style18Bold(context),
              ),
              Text(
                S.of(context).courseImageDescription,
                style: AppText.style16Regular(context),
              ),
              Text(
                S.of(context).courseImageNote,
                style: AppText.style14Regular(context),
                textAlign: TextAlign.center,
              ),
              ImagePickerContainer(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  pickedImage = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedImage != null) {
                    widget.imagePath.text = pickedImage!.path;
                    setState(() {});
                  }
                },
                imageName: pickedImage?.name,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
