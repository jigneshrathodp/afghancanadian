import 'package:afghancanadian/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'CustomCalendar.dart';
import 'bottom_nav_screen.dart';

void main() {
  runApp(const MyApp());}
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
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoTransitionsBuilder(),
            TargetPlatform.iOS: NoTransitionsBuilder(),
          },
        ),
        // Make app background white for all screens by default
        scaffoldBackgroundColor: Colors.white,
        // Ensure color scheme surface is white as well (background is deprecated)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          surface: Colors.white,
        ),
      ),
      home: CustomCalendar(),
      // DevicePreview builder and locale are commented out; nothing else needed here
    );

  }
}
