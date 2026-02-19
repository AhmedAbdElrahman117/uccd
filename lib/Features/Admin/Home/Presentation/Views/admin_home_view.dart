import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/dashboard.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/quick_actions.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/home_app_bar.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
        children: const [
          HomeAppBar(),
          QuickActions(),
          Dashboard(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
