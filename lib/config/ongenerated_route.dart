import 'package:city17/src/feature/auth/authentication_screen.dart';
import 'package:city17/src/feature/connect_display/screen/connect_display_screen.dart';
import 'package:city17/src/feature/create_display/screen/create_display_screen.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:city17/src/feature/location_setting/screen/location_setting.dart';
import 'package:city17/src/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

mixin AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AuthenticationScreen(),
        );

      case SplashScreen.routeName:
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

      case CreateDisplayScreen.routeName:
        return MaterialPageRoute(
          fullscreenDialog: true,
          settings: settings,
          builder: (context) => const CreateDisplayScreen(),
        );
      case LocationSetting.routename:
        return MaterialPageRoute(
          fullscreenDialog: true,
          settings: settings,
          builder: (context) => const LocationSetting(),
        );
      // case AdvertDetailScreen.routeName:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) => const AdvertDetailScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
