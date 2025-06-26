import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    required this.info,
    required this.icon,
    this.fontSize,
    this.fontColor,
    this.width,
    this.iconColor,
  });

  final String info;
  final IconData icon;
  final double? fontSize;
  final Color? fontColor;
  final Color? iconColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: (iconColor ?? ThemeHelper.appPrimaryColor).withValues(
              alpha: 0.1,
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor ?? ThemeHelper.appPrimaryColor,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            info,
            style: ThemeHelper.style14Regular(context).copyWith(
              color: fontColor,
              height: 1.5,
            ),
          ),
        ),
      ],
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
