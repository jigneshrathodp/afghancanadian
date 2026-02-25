import 'package:afghancanadian/splashscreen.dart';
import 'package:afghancanadian/Auth/signin.dart';
import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';

import 'clientside/Contact_membership_screen.dart';
import 'clientside/clientside_menu_screen.dart';
import 'clientside/contact_Invoice_recode_payment_screen.dart';
import 'clientside/contact_Invoice_screen.dart';
import 'clientside/contact_donation_add_screen.dart';
import 'clientside/contact_donation_screen.dart';
import 'clientside/contact_payment_screen.dart';
import 'clientside/credit_card_on_file_screen.dart';
import 'clientside/credit_change_password_screen.dart';
import 'clientside/dashboard_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}
class NoTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoTransitionsBuilder(),
            TargetPlatform.iOS: NoTransitionsBuilder(),
          },
        ),
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryDark).copyWith(
          surface: AppColors.background,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const Splashscreen(),
    );

  }
}
