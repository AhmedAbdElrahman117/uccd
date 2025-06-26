import 'package:flutter/material.dart';

class AppGlobalKeys {
  AppGlobalKeys._();

  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
}
