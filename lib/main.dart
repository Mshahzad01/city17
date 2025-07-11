import 'package:city17/config/dark_theme.dart';
import 'package:city17/config/ongenerated_route.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRoute.onGenerateRoute,

      theme: DarkTheme.theme,

      initialRoute: BottomNavScreen.rotename,

      /// SplashScreen.routename,
    );
  }
}
