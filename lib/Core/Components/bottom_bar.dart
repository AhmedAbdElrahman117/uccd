import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

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
  void initState() {
    widget.tabController.addListener(() {
      setState(() {
        current = widget.tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    final unselectedLabelColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black12
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          dividerColor: Colors.transparent,
          labelColor: AppColor.primary,
          overlayColor: WidgetStatePropertyAll(
            AppColor.primary.withValues(alpha: 0.15),
          ),
          unselectedLabelColor: unselectedLabelColor,
          indicatorColor: AppColor.primary,
          automaticIndicatorColorAdjustment: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: AppText.style12Bold(context),
          controller: widget.tabController,
          tabs: widget.barButtons.entries.indexed
              .map(
                (e) => Tab(
                  icon: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      e.$2.value,
                      color: e.$1 == current
                          ? AppColor.primary
                          : isDarkMode
                              ? Colors.white70
                              : Colors.black54,
                    ),
                  ),
                  iconMargin: const EdgeInsets.only(bottom: 8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      e.$2.key,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppText.style14Regular(context).copyWith(
                        color: e.$1 == current
                            ? AppColor.primary
                            : isDarkMode
                                ? Colors.white70
                                : Colors.black54,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          indicatorPadding: const EdgeInsets.only(bottom: 8),
          labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          onTap: (value) {
            if (current != value) {
              widget.tabController.animateTo(value);
              setState(() {
                current = value;
              });
            }
          },
        ),
      ),
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
