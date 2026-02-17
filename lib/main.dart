import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNavScreen(),
      useInheritedMediaQuery: true, // Required for DevicePreview
      //locale: DevicePreview.locale(context), // Required for DevicePreview
     // builder: DevicePreview.appBuilder, // Required for DevicePreview
    );

  }
}
