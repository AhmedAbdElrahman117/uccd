import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Logs%20Cubit/admin_logs_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Logs%20Cubit/admin_logs_states.dart';

class DateSelection extends StatelessWidget {
  const DateSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLogsCubit, AdminLogsStates>(
      buildWhen: (previous, current) => current is ChangeDate,
      builder: (context, state) {
        return EasyTheme(
          data: EasyTheme.of(context).copyWithState(
            locale: Localizations.localeOf(context),
            selectedCurrentDayTheme: const DayThemeData(
              backgroundColor: AppColor.primary,
              border: BorderSide(
                color: Colors.grey,
              ),
            ),
            unselectedDayTheme: const DayThemeData(
              border: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: EasyDateTimeLinePicker(
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            focusedDate: BlocProvider.of<AdminLogsCubit>(context).dateTime,
            currentDate: BlocProvider.of<AdminLogsCubit>(context).dateTime,
            onDateChange: (date) {
              BlocProvider.of<AdminLogsCubit>(context).changeDate(
                Timestamp.fromDate(date),
              );
            },
          ),
        );
      },
    );
  }
}
