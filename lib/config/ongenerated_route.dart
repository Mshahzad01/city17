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
          builder: (context) => SplashScreen(),
        );

      case BottomNavScreen.rotename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BottomNavScreen(),
        );

      case HomeScreen.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeScreen(),
        );

      // case LocationSetting.routename:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) => const LocationSetting(indexx: index),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
