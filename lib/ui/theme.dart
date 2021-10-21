import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);
const Color webViewPrimaryClr = Color(0xFFFFFFFF);
const Color blackClr = Colors.black;

class AppColor {
  static Color homePageBackground = const Color(0xFFfbfcff);
  static Color gradientFirst = const Color(0xff0f17ad);
  static Color gradientSecond = const Color(0xFF6985e8);
  static Color homePageTitle = const Color(0xFF302f51);
  static Color homePageSubtitle = const Color(0xFF414160);
  static Color homePageDetail = const Color(0xFF6588f4);
  static Color homePageIcons = const Color(0xFF3b3c5c);
  static Color homePageContainerTextSmall = const Color(0xFFf4f5fd);
  static Color homePageContainerTextBig = const Color(0xFFffffff);
  static Color homePagePlanColor = const Color(0xFFa2a2b1);
  static Color secondPageTopIconColor = const Color(0xFFb7bce8);
  static Color secondPageTitleColor = const Color(0xFFfefeff);
  static Color secondPageContainerGradient1stColor = const Color(0xFFfbfcff);
  static Color secondPageContainerGradient2ndColor = const Color(0xFFfbfcff);
  static Color secondPageIconColor = const Color(0xFFfafafe);
  static Color loopColor = const Color(0xFF6d8dea);
  static Color setsColor = const Color(0xFF9999a9);
  static Color circuitsColor = const Color(0xFF2f2f51);
}

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
}

TextStyle get webViewheadingStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}

TextStyle get webViewsubHeadingStyle {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)));
}

TextStyle get textButton {
  return GoogleFonts.lato(
      textStyle: (const TextStyle(
          fontSize: 12, color: Colors.black, letterSpacing: 3)));
}
