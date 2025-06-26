import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/user_data.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/user_image.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        UserData(),
        UserImage(),
      ],
    );
  }
}
