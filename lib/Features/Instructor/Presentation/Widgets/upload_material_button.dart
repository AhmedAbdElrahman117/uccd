import 'package:flutter/material.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/generated/l10n.dart';

class UploadMaterialButton extends StatelessWidget {
  const UploadMaterialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            AppBanners.showSuccess(
              message: 'Upcoming feature!',
              title: 'Not Available Yet',
            );
          },
          icon: const Icon(Icons.upload_file, size: 18),
          label: Text(S.of(context).uploadCourseMaterials),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
