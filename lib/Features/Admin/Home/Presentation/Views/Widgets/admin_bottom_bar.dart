import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';

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
  Map<String, IconData> adminBarButtons = {
    'Home': FontAwesomeIcons.house,
    'Courses': FontAwesomeIcons.bookOpen,
    'Community': FontAwesomeIcons.globe,
    'Profile': FontAwesomeIcons.solidUser,
  };

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      tabController: widget.tabController,
      barButtons: adminBarButtons,
    );
  }
}
