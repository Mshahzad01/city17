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



      iconTheme: const IconThemeData(color: Colors.white),

      

      
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white,fontFamily: 'Myfonts'),



        titleLarge:  TextStyle(color: AppColors.textcolor,fontSize: 24,fontWeight: FontWeight.w700,fontFamily: 'Myfonts'),
        
        titleMedium:  TextStyle(color: AppColors.textcolor,fontSize: 16,fontWeight: FontWeight.w700,fontFamily: 'Myfonts'),
        
        titleSmall:  TextStyle(color: AppColors.textcolor,fontSize: 14,fontWeight: FontWeight.w700,fontFamily: 'Myfonts')

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
