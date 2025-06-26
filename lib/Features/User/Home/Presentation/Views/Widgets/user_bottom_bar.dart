import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/bottom_bar.dart';

class UserBottomBar extends StatefulWidget {
  const UserBottomBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  Map<String, IconData> userBarButtons = {
    'Home': FontAwesomeIcons.house,
    'My Courses': FontAwesomeIcons.bookOpen,
    'Community': FontAwesomeIcons.globe,
    'Profile': FontAwesomeIcons.solidUser,
  };
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      tabController: widget.tabController,
      barButtons: userBarButtons,
    );
  }
}
