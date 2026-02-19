import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/language_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/profile_section_card.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/theme_mode_tile.dart';
import 'package:uccd/generated/l10n.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: ProfileSectionCard(
        title: S.of(context).settings,
        icon: Icons.settings_outlined,
        children: const [
          LanguageTile(),
          SizedBox(height: 8),
          ThemeModeTile(),
        ],
      ),
    );
  }
}
