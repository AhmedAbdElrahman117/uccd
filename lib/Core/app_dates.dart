import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/constants.dart';

class AppDates {
  AppDates._();

  static String timeStampToString(Timestamp timestamp) {
    return Jiffy.parseFromMillisecondsSinceEpoch(
      timestamp.millisecondsSinceEpoch,
    ).format(
      pattern: dateFormat,
    );
  }

  static String dateTimeToString(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime).format(
      pattern: dateFormat,
    );
  }

  static Timestamp stringToTimeStamp(String date) {
    return Timestamp.fromMillisecondsSinceEpoch(
      Jiffy.parse(
        date,
        pattern: dateFormat,
      ).millisecondsSinceEpoch,
    );
  }

  static DateTime stringToDateTime(String date) {
    return Jiffy.parse(
      date,
      pattern: dateFormat,
    ).dateTime;
  }

  static String timeStampToStringTime(Timestamp timeStamp) {
    return Jiffy.parseFromMillisecondsSinceEpoch(
      timeStamp.millisecondsSinceEpoch,
    ).jm;
  }

  static String postFormat(Timestamp date) {
    String interval = Jiffy.parseFromMillisecondsSinceEpoch(
      date.millisecondsSinceEpoch,
    ).fromNow();

    if (interval == 'a minute') {
      return '1 minute';
    } else if (interval == 'a day') {
      return '1 Day';
    } else if (interval == 'a week') {
      return '1 Week';
    } else if (interval == 'a month') {
      return '1 month';
    } else if (interval == 'a year') {
      return '1 year';
    }
    return interval;
  }

  static String formatLocalizedNumber(num number, BuildContext context) {
    final locale = Localizations.localeOf(context)
        .toLanguageTag(); // e.g., "ar", "en", "ko"
    final formatter = NumberFormat.decimalPattern(locale);
    return formatter.format(number);
  }

  static String formatLocalizedNumberDigits(num number, BuildContext context) {
    final locale = Localizations.localeOf(context)
        .toLanguageTag(); // e.g., "ar", "en", "ko"
    final formatter = NumberFormat.decimalPatternDigits(
      decimalDigits: 1,
      locale: locale,
    );
    return formatter.format(number);
  }

  static String formatLocalizedPercent(num number, BuildContext context) {
    final locale = Localizations.localeOf(context)
        .toLanguageTag(); // e.g., "ar", "en", "ko"
    final formatter = NumberFormat.decimalPercentPattern(
      locale: locale,
      decimalDigits: number.toInt(),
    );

    return formatter.format(number);
  }
}
