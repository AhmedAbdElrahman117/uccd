import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/Components/custom_image.dart';
import 'package:uccd/Core/Components/custom_title.dart';
import 'package:uccd/Core/Components/delete_button.dart';
import 'package:uccd/Core/Components/counter_banner.dart';
import 'package:uccd/Core/Components/item_background.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/edit_button.dart';

class FakeAvailableCourse extends StatelessWidget {
  const FakeAvailableCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ItemBackground(
        onTap: () {},
        child: Column(
          spacing: 20,
          children: [
            const Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImage(height: 100),
                CounterBanner(
                  current: 0,
                  max: 0,
                ),
              ],
            ),
            const CustomTitle(
              title: 'UI/UX Design (Mobile App & Web Design)',
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.049,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              children: [
                EditButton(
                  onPressed: () {},
                ),
                DeleteButton(
                  message: "",
                  onTapConfirm: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
