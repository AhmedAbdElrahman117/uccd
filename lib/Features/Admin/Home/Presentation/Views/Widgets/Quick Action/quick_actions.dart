import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/actions_grid.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: AppColor.primary,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      shadowColor: AppColor.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            SectionTitle(title: 'Quick Actions'),
            ActionsGrid(),
          ],
        ),
      ),
    );
  }
}
