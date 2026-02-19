import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    required this.info,
    required this.icon,
    this.fontSize,
    this.fontColor,
    this.width,
  });

  final String info;
  final IconData icon;
  final double? fontSize;
  final Color? fontColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: 20,
        ),
        title: Text(
          info,
          style: AppText.style14Bold(context),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
// Material(
//       type: MaterialType.transparency,
//       child: Wrap(
//         children: [
//           Icon(
//             icon,
//             color: fontColor ?? AppColor.applySecondary(context),
//             size: 20,
//           ),
//           const SizedBox(width: 12),
//           Text(
//             info,
//             style: AppText.style14Bold(context)
//                 .copyWith(
//                   color: fontColor ?? AppColor.applySecondary(context),
//                 )
//                 .copyWith(fontSize: fontSize),
//           ),
//         ],
//       ),
//     );
