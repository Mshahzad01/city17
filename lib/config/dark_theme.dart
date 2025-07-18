import 'package:city17/src/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.primarycolor,
      appBarTheme: AppBarTheme(color: AppColors.primarycolor),

      iconTheme: const IconThemeData(color: Colors.white),

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(color: Colors.white),
        bodyMedium: GoogleFonts.poppins(color: Colors.white),

        titleLarge: GoogleFonts.poppins(
          color: AppColors.primaryTextcolor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),

        titleMedium: GoogleFonts.poppins(
          color: AppColors.primaryTextcolor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),

        titleSmall: GoogleFonts.poppins(
          color: AppColors.primaryTextcolor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   primarycolor: Colors.white12,
      //   foregroundColor: Colors.white,
      // ),
    );
  }
}
