import 'package:city17/src/constant/app_color.dart';
import 'package:flutter/material.dart';


class DarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.appbackgroundcolor,
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: Colors.black,

      //   foregroundColor: Colors.white,
      //   elevation: 0,
      // ),

      appBarTheme: AppBarTheme(
        color: AppColors.appbackgroundcolor
      ),



      iconTheme: const IconThemeData(color: Colors.white),

      

      
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white,fontFamily: 'myfont'),
        bodyMedium: TextStyle(color: Colors.white,fontFamily: 'myfont'),



        titleLarge:  TextStyle(color: AppColors.textcolor,fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'myfont'),
        
        titleMedium:  TextStyle(color: AppColors.textcolor,fontSize: 15,fontWeight: FontWeight.w700,fontFamily: 'myfont'),
        
        titleSmall:  TextStyle(color: AppColors.textcolor,fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'myfont')

      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white12,
        foregroundColor: Colors.white,
      ),
      // bottomAppBarTheme: BottomAppBarTheme(
      //   color: Colors.black
      // )
    );
  }
}
