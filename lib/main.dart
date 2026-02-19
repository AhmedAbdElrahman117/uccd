import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:uccd/Core/app_global_keys.dart';
import 'package:uccd/Core/app_theme.dart';
import 'package:uccd/Core/notifier.dart';
import 'package:uccd/Core/route_nav.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views%20Model/admin_home_cubit.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/user_course_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  InternalStorage._(preferences);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );

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

  runApp(const UCCD());
}

class UCCD extends StatelessWidget {
  const UCCD({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdminHomeCubit()),
        BlocProvider(create: (context) => UserCourseCubit()),
      ],
      child: ToastificationWrapper(
        child: ValueListenableBuilder(
          valueListenable: Notifier.theme,
          builder: (context, value, child) {
            return MaterialApp.router(
              routerConfig: RouteNav.router,
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: AppGlobalKeys.scaffoldKey,
              theme: AppTheme.lightTheme(context),
              darkTheme: AppTheme.darkTheme(context),
              themeMode: value,
            );
          },
        ),
      ),
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

  static void setBool(String key, bool value) async {
    await userData.setBool(key, value);
  }

  static String getString(String key) {
    String? data = userData.getString(key);
    if (data != null) {
      return data;
    }
    return '';
  }

  static bool? getBool(String key) {
    bool? data = userData.getBool(key);
    if (data != null) {
      return data;
    }
    return null;
  }
}
