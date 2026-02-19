import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/logout_tile.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/profile_section_card.dart';
import 'package:uccd/generated/l10n.dart';

class ProfileAccountSection extends StatelessWidget {
  const ProfileAccountSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
      child: ProfileSectionCard(
        title: S.of(context).account,
        icon: Icons.account_circle_outlined,
        children: const [
          LogoutTile(),
        ],
      ),
    );
  }
}
