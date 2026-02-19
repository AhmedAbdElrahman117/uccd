import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
    this.onTap,
    this.imageName,
  });

  final void Function()? onTap;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RectDottedBorderOptions(
          padding: const EdgeInsets.all(6),
          strokeCap: StrokeCap.round,
          dashPattern: const [5, 5, 5, 5],
          strokeWidth: 2,
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                const Icon(
                  Icons.add_a_photo_outlined,
                  size: 24,
                ),
                Text(
                  S.of(context).tapToAddImage,
                  style: AppText.style16Bold(context),
                ),
                Text(
                  S.of(context).imageSizeLimit,
                  style: AppText.style14Bold(context),
                ),
                Text(
                  imageName ?? '',
                  style: AppText.style14Bold(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
