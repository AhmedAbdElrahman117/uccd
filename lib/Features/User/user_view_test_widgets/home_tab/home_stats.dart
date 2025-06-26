import 'package:flutter/material.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/user_info_card.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';
import 'package:uccd/main.dart';
import 'package:uccd/generated/l10n.dart';

class HomeStats extends StatelessWidget {
  const HomeStats({super.key});

  String _getLocalizedYear(BuildContext context, String? year) {
    switch (year) {
      case '1st year':
        return S.of(context).firstYear;
      case '2nd year':
        return S.of(context).secondYear;
      case '3rd year':
        return S.of(context).thirdYear;
      case '4th year':
        return S.of(context).fourthYear;
      default:
        return year ?? '';
    }
  }

  String _getLocalizedDepartment(BuildContext context, String? department) {
    switch (department) {
      case 'Information Technology':
        return S.of(context).informationTechnology;
      case 'Mechatronics':
        return S.of(context).mechatronics;
      case 'Autotronics':
        return S.of(context).autotronics;
      case 'Renewable Energy':
        return S.of(context).renewableEnergy;
      case 'Orthotics & Prosthetics':
        return S.of(context).orthoticsProsthetics;
      default:
        return department ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            child: UserInfoCard(
              label: S.of(context).currentYear,
              value: _getLocalizedYear(
                context,
                InternalStorage.getString('year'),
              ),
              icon: Icons.school,
              iconColor: UserThemeHelper.getPrimaryStatColor(context),
              backgroundColor: UserThemeHelper.getCardBackgroundColor(context),
              borderColor: UserThemeHelper.getCardBorderColor(context),
            ),
          ),
          Expanded(
            child: UserInfoCard(
              label: S.of(context).department,
              value: _getLocalizedDepartment(
                context,
                InternalStorage.getString('department'),
              ),
              icon: Icons.business,
              iconColor: UserThemeHelper.getSecondaryStatColor(context),
              backgroundColor: UserThemeHelper.getCardBackgroundColor(context),
              borderColor: UserThemeHelper.getCardBorderColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
