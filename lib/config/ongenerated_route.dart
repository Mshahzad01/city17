import 'package:city17/src/feature/connect_display/screen/connect_display_screen.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:city17/src/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

mixin AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );

      case BottomNavScreen.rotename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BottomNavScreen(),
        );

      case HomeScreen.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeScreen(),
        );

      case ConnectDisplyScreen.routeName:
        return MaterialPageRoute(
          fullscreenDialog: true,
          settings: settings,
          builder: (context) => const ConnectDisplyScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
