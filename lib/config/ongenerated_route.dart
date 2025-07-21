import 'package:city17/src/feature/connect_display/screen/displaysetup_three.dart';
import 'package:city17/src/feature/connect_display/widgets/setep_indicator_widget.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:city17/src/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../src/feature/connect_display/screen/connet_display_setep1.dart';
import '../src/feature/connect_display/screen/disply_setup2.dart';

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
      case Connectdisplaysetpone.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Connectdisplaysetpone(),
        );

      case DisplySetupTwo.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const DisplySetupTwo(),
        );
      case DisplaySetupThree.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const DisplaySetupThree(),
        );


 
     
        //  case DisplaySetupFlowScreen.routename:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (context) => const DisplaySetupFlowScreen(),
        // );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
