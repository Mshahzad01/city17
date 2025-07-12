import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static const routename = "/splash";
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override



 void initState() {
    super.initState();
      

      _dely();

 }
   

  Future<void> _dely() async {
    await Future.delayed(Duration(seconds: 02));
        Navigator.pushReplacementNamed(context,SplashScreen.routename);
  }

  List<String> verticalTexts = const [
    "Decentralized Advertisement Network",
    "Dezentrales Werbenetzwerk",
    "وکندریقرت ایڈورٹائزنگ نیٹ ورک",
    "Dezentrales Werbenetzwerk",
    "분산형 광고 네트워크",
    "Децентрализованная рекламная сеть",
    "分散型広告ネットワーク",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashbroudcolor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
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
                                color: AppColors.textcolor.withValues(
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
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                   Image.asset(AssetString.logo,height: 60,width: 150,),
              
                SizedBox(height: 6),
                Text(
                  "Display Manager",
                  style: context.myTextTheme.titleLarge?.copyWith(
                    fontSize: 12,
                    color: AppColors.textcolor.withValues(alpha: 0.4),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),

          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, BottomNavScreen.rotename,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff2D3042),
                ),
                margin: EdgeInsets.only(left: 12, right: 12),
              
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              
                    Image.asset(AssetString.googlepic),
                
              
                    SizedBox(width: 20),
              
                    Text(
                      "Sign in with Google",
                      style: context.myTextTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "By proceeding you accept all terms and conditions",
                  style: context.myTextTheme.titleLarge?.copyWith(
                    fontSize: 12,
                    color: AppColors.textcolor,
                  ),
                ),
                SizedBox(height: 4),

                Padding(
                  padding: EdgeInsets.only(left: 220),
                  child: Text(
                    "V1.0 M",
                    style: context.myTextTheme.titleLarge?.copyWith(
                      fontSize: 12,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
