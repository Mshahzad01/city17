// import 'package:flutter/material.dart';

// class AppColors {
//   //Baground Color
//   static const backgroundcolor = Color(0xff252733);
//   static const bottombarcolor = Color(0xff20222D);
//   static const secondrybagroundcolor = Color(0xff2D3042);

//   //text color
//   static const textcolor = Color(0xffF4F4F4);
//   static const secondarytextcolor = Color(0xffE37F47);
//   static const purpletextcolor = Color(0xff5565AF);
//   static const greentextcolor = Color(0xff32CD32);
//   static const redtextcolor = Color(0xffEE6C77);
//   static const textbuttoncolor = Color(0xffFF5E5E);

//   //button color

//   static const blckbtncolor = Color(0x40000000);
// }
import 'package:flutter/material.dart';

mixin AppColors {
  // Background Colors
  static const Color primarycolor = Color(0xFF252733);
  static const Color bottombarcolor = Color(0xFF20222D);
  static const Color secondarycolor = Color(0xFF2D3042);

  // Text Colors
  static const Color primaryTextcolor = Color(0xFFF4F4F4);
  static const Color accentTextcolor = Color(
    0xFFE37F47,
  ); // maybe for highlights
  static const Color linkTextcolor = Color(
    0xFF5565AF,
  ); // like clickable or secondary
  static const Color successTextcolor = Color(0xFF32CD32);
  // green text (success)
  static const Color errorTextcolor = Color(0xFFEE6C77); // red text (error)
  static const Color warningTextcolor = Color(0xFFFF5E5E);

  static const Color textButtoncolor = Color(
    0xff23272F,
  ); // used in warning buttons etc.

  // Button Colors
  static const Color transparentBlack = Color(0x40000000); // 25% opacity black
}
