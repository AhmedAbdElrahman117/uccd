import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Components/image_picker_container.dart';
import 'package:uccd/Core/app_text.dart';

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
                'Course Image',
                style: AppText.style18Bold(context),
              ),
              Text(
                'Finally you can Add an Image to your course',
                style: AppText.style16Regular(context),
              ),
              Text(
                'Note: if you Don\'t add an image to the course the course will have the UCCD logo automatically',
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
