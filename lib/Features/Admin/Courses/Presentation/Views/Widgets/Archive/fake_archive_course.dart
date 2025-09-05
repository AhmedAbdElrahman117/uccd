import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/Components/custom_image.dart';
import 'package:uccd/Core/Components/custom_info.dart';
import 'package:uccd/Core/Components/custom_title.dart';
import 'package:uccd/Core/Components/item_background.dart';

class FakeArchiveCourse extends StatelessWidget {
  const FakeArchiveCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ItemBackground(
        child: Column(
          spacing: 20,
          children: [
            CustomImage(
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTitle(
                    title: 'knsacjnskajnajsccaskjbsahkbsakcjbsacjk',
                  ),
                  CustomInfo(
                    info: 'scmakskkn',
                    icon: FontAwesomeIcons.solidCalendarPlus,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
