import 'package:flutter/material.dart';

class InstructorView extends StatefulWidget {
  const InstructorView({super.key});

  static const String id = '/instructorView';

  @override
  State<InstructorView> createState() => _InstructorViewState();
}

class _InstructorViewState extends State<InstructorView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
