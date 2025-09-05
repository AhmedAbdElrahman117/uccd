import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/circle_tab_indicator.dart';

class BottomBar extends StatefulWidget {
  const BottomBar(
      {super.key, required this.tabController, required this.barButtons});

  final TabController tabController;

  final Map<String, IconData> barButtons;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: CircleTabIndicator(
        color: AppColor.primary,
        radius: 4,
      ),
      dividerColor: Colors.transparent,
      labelColor: AppColor.primary,
      indicatorColor: AppColor.primary,
      automaticIndicatorColorAdjustment: true,
      controller: widget.tabController,
      tabs: widget.barButtons.entries.indexed
          .map(
            (e) => Tab(
              text: e.$2.key,
              icon: Icon(
                e.$2.value,
                size: 20,
                color: e.$1 == current
                    ? AppColor.primary
                    : Theme.of(context).iconTheme.color,
              ),
              iconMargin: const EdgeInsets.only(bottom: 4),
            ),
          )
          .toList(),
      indicatorPadding: const EdgeInsets.only(bottom: 8),
      labelPadding: const EdgeInsets.only(bottom: 4),
      onTap: (value) {
        if (current != value) {
          widget.tabController.animateTo(value);
          setState(() {
            current = value;
          });
        }
      },
    );
  }
}

//with Material as Parent

//  color: Theme.of(context).scaffoldBackgroundColor,
//       elevation: 30,
//       shape: RoundedRectangleBorder(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//         ),
//         side: BorderSide(
//           color: Theme.of(context).brightness.index == 0
//               ? Colors.white24
//               : Colors.black12,
//         ),
//       ),
