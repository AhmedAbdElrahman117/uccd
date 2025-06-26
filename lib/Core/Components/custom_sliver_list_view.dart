import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/App%20Bar/home_app_bar.dart';

class CustomSliverListView extends StatelessWidget {
  const CustomSliverListView({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.actions,
    this.bottom,
    this.customWidget,
  });

  final String appBarTitle;
  final Widget body;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          customWidget != null
              ? const SliverToBoxAdapter(
                  child: HomeAppBar(),
                )
              : SliverAppBar(
                  centerTitle: true,
                  title: SectionTitle(title: appBarTitle),
                  actions: actions,
                  bottom: bottom,
                ),
        ];
      },
      body: body,
    );
  }
}
