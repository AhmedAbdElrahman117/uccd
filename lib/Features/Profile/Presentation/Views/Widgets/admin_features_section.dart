import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/logs_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/profile_section_card.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/users_tile.dart';
import 'package:uccd/main.dart';
import 'package:uccd/generated/l10n.dart';

class AdminFeaturesSection extends StatelessWidget {
  const AdminFeaturesSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      title: S.of(context).adminFeatures,
      icon: Icons.admin_panel_settings_outlined,
      children: [
        Visibility(
          visible: InternalStorage.getString('role') == 'SuperAdmin',
          child: const Column(
            spacing: 8,
            children: [
              UsersTile(),
              LogsTile(),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Visibility(
          visible: InternalStorage.getString('role') == 'Admin' ||
              InternalStorage.getString('role') == 'SuperAdmin',
          child: const CategoryTile(),
        ),
      ],
    );
  }
}
