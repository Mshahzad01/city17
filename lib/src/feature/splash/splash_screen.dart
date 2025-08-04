import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:city17/src/feature/auth/authentication_screen.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';
import 'package:city17/src/services/geo_locator_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    final nav = Navigator.of(context);
    final authRes = await SharedPrefUtils.getLoginInfo();
    GeolocatorService.instance.startUpdatingMyLoc();

    nav.pushReplacementNamed(
      authRes == null
          ? AuthenticationScreen.routename
          : BottomNavScreen.rotename,
    );
  }

  List<String> verticalTexts = const [
    'Decentralized Advertisement Network',
    'Dezentrales Werbenetzwerk',
    'وکندریقرت ایڈورٹائزنگ نیٹ ورک',
    'Dezentrales Werbenetzwerk',
    '분산형 광고 네트워크',
    'Децентрализованная рекламная сеть',
    '分散型広告ネットワーク',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: verticalTexts.map((text) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: text
                      .split('')
                      .map(
                        (char) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.5),
                          child: Text(
                            char,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.primaryTextcolor.withValues(
                                alpha: 0.1,
                              ),

                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              }).toList(),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(AssetString.logo, height: 60, width: 150),

              const SizedBox(height: 6),
              Text(
                'Display Manager',
                style: context.myTextTheme.titleLarge?.copyWith(
                  fontSize: 12,
                  color: AppColors.primaryTextcolor.withValues(alpha: 0.4),
                ),
              ),
              const Spacer(),

              const SizedBox(height: myPadding),

              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      'V1.0 M',
                      style: context.myTextTheme.titleLarge?.copyWith(
                        fontSize: 12,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
