import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';
import 'package:uccd/generated/l10n.dart';

class AdminBottomBar extends StatefulWidget {
  const AdminBottomBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  @override
  Widget build(BuildContext context) {
    Map<String, IconData> adminBarButtons = {
      S.of(context).home: FontAwesomeIcons.house,
      S.of(context).courses: FontAwesomeIcons.bookOpen,
      S.of(context).community: FontAwesomeIcons.globe,
      S.of(context).profile: FontAwesomeIcons.solidUser,
    };

    return BottomBar(
      tabController: widget.tabController,
      barButtons: adminBarButtons,
    );
  }
}
