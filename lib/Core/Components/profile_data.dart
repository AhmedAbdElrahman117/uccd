import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/user_image.dart';
import 'package:uccd/main.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.27,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const UserImage(radius: 45),
          Text(
            InternalStorage.userData.getString('name') ?? '',
            style: AppText.style16Bold(context),
          ),
          Text(
            InternalStorage.userData.getString('email') ?? '',
            style: AppText.style16Bold(context),
          ),
          Text(
            InternalStorage.userData.getString('role') ?? '',
            style: AppText.style16Bold(context),
          ),
        ],
      ),
    );
  }
}
