import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
// import 'package:uccd/Core/Notification%20System.dart';
import 'package:uccd/Core/app_global_keys.dart';
import 'package:uccd/Core/app_theme.dart';
import 'package:uccd/Core/notification_service.dart';
import 'package:uccd/Core/route_nav.dart';
import 'package:uccd/Core/utils_provider.dart';
import 'package:uccd/generated/l10n.dart';

@pragma('vm:entry-point')
Future<dynamic> firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  log('Handling a background message: ${message.messageId}');
  if (message.notification != null) {
    log('background');
    NotificationSystem.notificationController.createNotification(
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  InternalStorage._(preferences);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );

  NotificationService().init();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await Supabase.initialize(
    url: 'https://zmoejgvxfufurmezwagi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inptb2VqZ3Z4ZnVmdXJtZXp3YWdpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0MTgxNzEsImV4cCI6MjA1Mzk5NDE3MX0.Vf5LNNTgWB8JUjbuICWvs8JXt8_C-EuKvyk4qtMyAZQ',
  );

  EmailOTP.config(
    appName: 'UCCD',
    otpType: OTPType.numeric,
    expiry: 600000,
    emailTheme: EmailTheme.v5,
    appEmail: 'UCCDBTU@gmail.com',
    otpLength: 5,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => UtilsProvider(),
      child: const UCCD(),
    ),
  );
}

class UCCD extends StatelessWidget {
  const UCCD({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilsProvider>(
      builder: (context, provider, child) {
        return ToastificationWrapper(
          child: MaterialApp.router(
            routerConfig: RouteNav.router,
            locale: provider.locale,
            localizationsDelegates: [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: AppGlobalKeys.scaffoldKey,
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode: provider.themeMode,
          ),
        );
      },
    );
  }
}

class InternalStorage {
  static late SharedPreferences userData;

  InternalStorage._(SharedPreferences pref) {
    userData = pref;
  }

  static void setString(String key, String value) async {
    await userData.setString(key, value);
  }

  static String getString(String key) {
    String? data = userData.getString(key);
    if (data != null) {
      return data;
    }
    return '';
  }
}
